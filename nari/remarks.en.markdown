### Remarks

Brainfuck interpreter.  Run as:

    ruby entry.rb hello_world.br

If you give --history option, it prints type statse for each instruction
after the program termination.

    ruby entry.rb --history hello_world.br

I confirmed the following implementations/platforms:

* ruby 2.0.0p0 (2013-02-24 revision 39474) [x86\_64-linux]
* ruby 1.9.3p362 (2012-12-25 revision 38607) [x86\_64-linux]

### Description

A brainfuck interpreter which uses CRuby's ObjectSpace as its tape.

### Internals

This exploits ...

`ObjectSpace.each_object`のブロックにメモリアドレスの低い順にオブジェクト
が渡される特徴を利用しています。
この特徴を利用すれば、`each_object`に特定のクラスに属するオブジェクトが渡っ
てきたときに、より高位のアドレスにさらに特定のクラスに属するオブジェク
トを無理やり配置することで、`each_object`のループが継続する状態を作り出す
ことができます。

上記の仕組みを利用して、Brainf\*ckを作ってみました。
`each_object`でテープのそれぞれのデータを1つずつ読み取り、それを
Brainf\*ckの1命令実行後のテープの状態に変換して高位のアドレスに対して配
置します。
これを繰り返していくことによって、一度の`each_object`呼び出しで完結した
Brainf\*ck言語処理系が実装可能となりました。

また、1命令毎のテープ・ヘッドの状態をすべてオブジェクト空間自体に保存し
ているので、1命令毎の挙動を簡単に調べることができ、デバッグが容易です。

### Limitation

* Consume a lot of memory, which may cause SEGV,
  * though simple programs such as hello world should work.
* 高位アドレスにどんどんオブジェクトを配置していくというアルゴリズムの
  という性質上、広大な論理アドレス空間が必要です。たぶん32bitマシンだと
  動きかないことが多そうです。
