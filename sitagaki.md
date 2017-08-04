週報 =======================================================  
* 週: 7週(2017/07/13〜07/27)
* 学籍番号: 1730097 
* 氏名: 眞下美紅 <br>
<br>
週報内容----------------------------------------------------  <br>
1. ウェーブレット変換を用いた超解像について <br>
離散ウェーブレット変換でLL(縦横低周波), HL(横高周波、縦低周波), LH(横低周波、縦高周波), HH(縦横高周波) の４つを作る。
<img src="https://raw.githubusercontent.com/mashimomiku/code/master/image/%E3%82%A6%E3%82%A7%E3%83%BC%E3%83%96%E3%83%AC%E3%83%83%E3%83%88%E5%88%86%E8%A7%A3.png">
４つそれぞれ超解像を行って逆ウェーブレット変換し、高解像度画像を出力する
<img src="https://raw.githubusercontent.com/mashimomiku/code/master/image/%E5%9B%B3.png">
<br>
超解像に使う辞書は110枚の自然画像とそのLL,HL,LH,HH画像を合わせた500枚ほどの画像で学習したものを使った。<br><br>
2. レナの画像でやると <br>
*ノイズなし1/2サイズにしたレナ画像をもとにもどす (※前回PSNR間違っていたので直してる) <br>
オリジナル <br>  
<img src="https://raw.githubusercontent.com/mashimomiku/ScSR/master/Data/Testing/gnd.bmp">
入力画像（オリジナルの1/2サイズ）    
<img src="https://raw.githubusercontent.com/mashimomiku/code/master/Data/Testing/input.bmp">
バイキュービックで拡大　PSNR 30.88
<img src="https://raw.githubusercontent.com/mashimomiku/code/master/image/bicu30%2C8820.bmp">
今までの超解像 PSNR 32.39                     
<img src="https://raw.githubusercontent.com/mashimomiku/code/master/image/nonoiseSR.bmp">
ウェーブレット変換を用いた超解像  PSNR 7.4396   
<img src="https://raw.githubusercontent.com/mashimomiku/code/master/image/nonoisewSR.bmp">
<br>
<br>
<img src="https://raw.githubusercontent.com/mashimomiku/code/master/image/kakudai2.bmp"><img src="https://raw.githubusercontent.com/mashimomiku/code/master/image/kakudai1.bmp">
ウェーブレット変換を用いて超解像したものを拡大して見てみても、変なノイズが入っていて線もがたがたしているので解像度が逆に下がっているように見える(?)<br>
そこで初めにウェーブレット変換をした時のLL画像を見てみると、
<img src="https://raw.githubusercontent.com/mashimomiku/code/master/image/LLlena.bmp">
入力画像の1/2の大きさになってしまうのでかなり小さく、そこでもともと持っている情報を失っている気がしたので、入力画像をバイキュービック法で2倍の大きさにしてからウェーブレット変換し、超解像、逆ウェーブレット変換してから1/2のサイズにしてオリジナル画像とのPSNR値を測ってみた。
<img src="https://raw.githubusercontent.com/mashimomiku/code/master/image/nonoisewSR2.bmp">
PSNR値は7.4404→7.4387に下がったが見た目的にはマシになった？
<img src="https://raw.githubusercontent.com/mashimomiku/code/master/image/kakudai3.bmp">
<br>
さらに入力画像を4倍にして試したところ
<img src="https://raw.githubusercontent.com/mashimomiku/code/master/image/wSR4bai.bmp">
↑PSNR値は7.4381でほぼ変わらないが、線がだいぶなめらかになっている。

3. まとめ<br>
結果は, 辞書学習型超解像 > バイキュービック法 >>> ウェーブレット変換を用いた超解像。<br>
入力画像にノイズをつけて試しても似たような結果になった。ただし今までの超解像だと逆にノイズを強調してしまうためバイキュービック法が一番結果が良かった。
<br>
改善点<ul>
  <li>やり方を変える？         </li>
  <li>辞書に学習させる画像を変える       </li>
  <li>ウェーブレット変換でノイズ除去しつつ超解像みたいなことができればいいなって思った      </li>
</ul>

