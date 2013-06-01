def encode(url)
  ns = url.chars.map(&:ord)
  med = (ns.min+ns.max)/2
  minused = ns.map{|n| n - med}
  positive = minused.map{|n| n >= 0}.map{|b| b ? "Ruby" : "ruby"}.join(" ")
  abses = minused.map(&:abs)
  ms = abses.uniq.sort
  p ms: ms
  template = ["rUBY", "Ruby"]
  idxs = abses.map{|a| ms.index(a)}
  p idxs: idxs
  puts "%i(" + idxs.map{|idx|
    if idx == 16
      "Ruby!"
    else
      ("%04b" % idx).chars.reverse.map.with_index{|b, i| template[b.to_i][i]}.join
    end
  }.join(" ") + ")"
end
encode("http://youtu.be/qObzgUfCl28")
