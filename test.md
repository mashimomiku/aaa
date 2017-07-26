週報 =======================================================  
* 週: 7週(2017/07/13〜07/27)
* 学籍番号: 1730097 
* 氏名: 眞下美紅                                                                                                               
週報内容----------------------------------------------------  
1. ウェーブレット変換を用いた超解像について <br>
離散ウェーブレット変換をしたそれぞれの周波数の画像をパックにして辞書学習し超解像しないといけないみたいなので、コードを書き換えて最中です           
(Learning-Based Super-Resolution System Using Single Facial Image and Multi-resolution Wavelet Synthesis
(Shu-Fan Lui, Jin-Yi Wu, Hsi-Shu Mao, and Jenn-Jier James Lien))を参考に読んだ



2. レナの画像でやると <br>                                                                                                 
オリジナル <br>  
<img src="https://raw.githubusercontent.com/mashimomiku/ScSR/master/Data/Testing/gnd.bmp">
入力画像
<img src="https://raw.githubusercontent.com/mashimomiku/code/master/Data/Testing/input.bmp">
今までの超解像 PSNR 34.26               
<img src="https://raw.githubusercontent.com/mashimomiku/ScSR/master/SR34.267392.bmp">
ウェーブレット変換を用いた超解像  PSNR 18.92
<img src="https://raw.githubusercontent.com/mashimomiku/ScSR/master/18.9295.bmp">
<br>
と、今のところなっているので直します
