### Remarks

引数なしで普通に実行してください。

    ruby entry.rb

以下の実装・プラットフォームで動作確認しています。

* ruby 2.0.0p0 (2013-02-24 revision 39474) [x86\_64-darwin12.2.1]

### Description

主題に関連するURLを表示します。

### Internals

ローカル変数としての「ruby」と、メソッドとしての「ruby」が共存できること、
名前空間を分ければ同名の定数が定義できること、
クラスが違えば同名のメソッドを定義できることを利用しています。
module定義以降はRubyでないメソッドは使用していません(演算子以外)。

        ruby.ruby.ruby.ruby.ruby{|ruby, _ruby|

このへんがお気に入りです。

文字列のエンコーディング方法についてはencode.rbを参照してください(特に
難しいことはしていません)。うまい人がやればもっと短くできるんだと思います...。

ネーミング以外の難読化はあまりしていません。

### Limitation

%iを使ってみたかったので、Ruby 2.0でないと動きません。


参考： http://ja.wikipedia.org/wiki/Buffalo_buffalo_Buffalo_buffalo_buffalo_buffalo_Buffalo_buffalo
