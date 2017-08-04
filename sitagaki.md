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
超解像に使う辞書は110枚の自然画像とそのLL,HL,LH,HH画像を合わせた500枚ほどの画像で学習したものを使った。


2. レナの画像でやると <br>
*ノイズなし1/2サイズにしたレナ画像をもとにもどす (※前回PSNR間違っていたので直してる) <br>
オリジナル <br>  
<img src="https://raw.githubusercontent.com/mashimomiku/ScSR/master/Data/Testing/gnd.bmp">
入力画像（オリジナルの1/2サイズ）    
<img src="https://raw.githubusercontent.com/mashimomiku/code/master/Data/Testing/input.bmp">
バイキュービックで拡大　PSNR 30.88

今までの超解像 PSNR 32.39                     
<img src="https://raw.githubusercontent.com/mashimomiku/code/master/image/nonoiseSR.bmp">
ウェーブレット変換を用いた超解像  PSNR 7.4396      
<img src="https://raw.githubusercontent.com/mashimomiku/ScSR/master/18.9295.bmp">xxx
<br>
と、今のところなっているので直したい


辞書について
