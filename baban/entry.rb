CONTEXT=->{

Alice.in.wonderland._

__ Alice.was.beginning_to.get.very._tired.of.her.sitting.by.her.sister.on.the.bank,
and_.of.having.nothing.to.do, once.or.twice.she.had.peeped.into.the.book.her
.sister.was.reading

but it.had.no.pictures.or.conversations.in.it, "and what is the use of a book,", 
thought.Alice, "without pictures or conversations?"

when_.suddenly A.WhiteRabbit.with.pink.eyes._ran.close.by.her

There.was.nothing.so.very.remarkable.in.that._; nor.did Alice.think.it.so.very
.much.out.of.the.way.to._hear, The.Rabbit._say.to
.itself("Oh dear! Oh dear! I shall be too late!")

but.when The.Rabbit.actually.took.a.watch.out.of.its.waistcoat_pocket,and_.then
.hurried.on, Alice._started.to.her._feet, for_.it.flashed.across.her.mind.that
.she.had.never.before.seen.a.rabbit.with.either.a.waistcoat_pocket,or_.a.watch
.to.take.out.of.it, and_.burning.withcuriosity, She._ran.across.the.field.after
.it.and.was.just.in.time.to.see.it._pop_down.a.large.rabbit.hole.under.the.hedge

puts "#{'-'*40}\ncharacter status\n#{'-'*40}"

Alice.events
WhiteRabbit.events
}

class Method
  def method_missing n,*_
    print "#{n} "
    __ *_
  end
end

class Object
  attr_accessor :t

  def _
    puts _p
  end

  def _p
    s = @t.map(&:to_s)*" "
    @t = []
    s
  end

  def self.method_missing n
    o = self.new
    o.t=[ self, n ]
    o
  end

  def method_missing n,*_
    return Object.new.method_missing n,*_ if self.to_s=="main"
    n=n.to_s
    (@t ||= [])<< n
    []!=_ && @t<< %|"#{_.map(&:to_s)*' '}"|
    self
  end
  alias :ms :method_missing
end

class P
  def self.method_missing n
    o = eval(n.to_s).new
    o.t = [self,n]
    o
  end
end

def __ *_
  []==_ ? method(:__) :
  puts(_.map{|o|o.is_a?(String) ? %|"#{o}"| : o._p}*", "+".")
end

%w[but when_ nor].map { |i| eval %|def #{i} *_
print "#{i} "
__(*_)
end| }
%w[A The].map { |i| eval %|class #{i} < P
end| }
%w[Alice WhiteRabbit There].map { |i| eval %$
class #{i}
  @@e=[]
  def method_missing n,*_
    m = n.to_s.match(/^_(.+)/).to_a[1]
    m && @@e<< [m, "line:"+caller[0].scan(/[0-9]+/)[0]]
    ms m||n,*_
  end
  def self.events
    @@e.map{ |_| puts self.to_s+" : "+_*"\t" }
  end
end
$ }
class Rabbit < WhiteRabbit
end
class She < Alice
end

CONTEXT.call
