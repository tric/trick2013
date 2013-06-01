GC.disable
Tape = ObjectSpace

class Cell
  attr_accessor :symbol
  def initialize(s)
    @symbol = s
  end
end

class BF
  def initialize
    @max_id = 0
  end

  def run(src)
    state = {pc: 0, head: 0, op: src[0]}
    inc = last = 0
    clocked = false
    _, jump = src.chars.each_with_object([[], {}]).with_index do |(c, (s, b)), i|
      case c
      when "["
        s << i
      when "]"
        b[s.pop] = i
      end
      [s, b]
    end

    # initialize tape
    put_cell(0)
    put_cell(state.dup)

    # run
    Tape.each_object(Cell) do |cell|
      next if cell.symbol.nil?
      if sentinel?(cell)
        last = inc-1
        inc = 0
        clocked = false
        state[:pc] += 1
        break if state[:pc] >= src.size
        state[:op] = src[state[:pc]]
        put_cell(state.dup.merge(last: last))
        next
      end
      cell = put_cell(cell.symbol)
      if inc == state[:head] && !clocked
        case state[:op]
        when ?> then state[:head]+=1; put_cell(0) if state[:head] > last
        when ?< then state[:head]-=1
        when ?+ then (cell.symbol > 255) ? cell.symbol=0 : cell.symbol+=1
        when ?- then (cell.symbol <= 0) ? cell.symbol=255 : cell.symbol-=1
        when ?. then print cell.symbol.chr
        when ?, then cell.symbol = getc
        when ?[ then state[:pc] = jump[state[:pc]] if cell.symbol.zero?
        when ?] then state[:pc] = jump.invert[state[:pc]] - 1
        else raise "no order"
        end
        clocked = true
      end
      inc += 1
    end
  end

  def history
    puts "TAPE HISTORY"
    Tape.each_object(Cell) do |cell|
      next if cell.symbol.nil?
      if sentinel?(cell)
        puts "..."
        puts cell.symbol
        puts "-" * 20
        next
      end
      print cell.symbol.to_s + "|"
    end
  end

  private
  def sentinel?(cell)
    cell.symbol.is_a?(Hash)
  end

  def put_cell(s)
    begin
      c = Cell.new(nil)
    end while @max_id > c.object_id
    @max_id = c.object_id
    c.symbol = s
    return c
  end
end

bf = BF.new
begin
  bf.run(File.read(ARGV.last).gsub("\n", ""))
ensure
  bf.history if ARGV[0] == "--history"
end
