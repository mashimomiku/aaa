週報 =======================================================  
* 週: 8週(2017/08/05〜08/17)
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
→やり方をすこしずつ変えてやってみたが、結局bicubic法や今まで使っていた超解像の方法より劣る結果になった。<br>
→→ので、ノイズを含んだ画像に対して有効か検証した。<br><br>

2. レナの画像でやると <br>
*ガウスノイズをのせ1/2サイズにしたレナ画像をもとにもどす<br>
オリジナル <br>  
<img src="https://raw.githubusercontent.com/mashimomiku/ScSR/master/Data/Testing/gnd.bmp">
入力画像  
<img src="https://raw.githubusercontent.com/mashimomiku/code/master/image/noise.bmp">
バイキュービックで拡大　PSNR 21.43
<img src="https://raw.githubusercontent.com/mashimomiku/code/master/image/bicubic.bmp">
今までの超解像 PSNR 19.70                     
<img src="https://raw.githubusercontent.com/mashimomiku/code/master/image/SR.bmp">
<br>
bicubic法にくらべ辞書学習型超解像の結果はPSNR値が高かったが、ノイズを含む画像に対してはノイズもはっきりとさせてしまうためbicubic法の方が結果が良かった。<br>
これに対しウェーブレット変換を用いてノイズ除去も考慮しながら超解像を行った。<br>
手法はノイズ除去のためにWabelet Shrinkage法を用い、この工程を上の手法の途中で行った。<br>
結果　PSNR 23.08
<img src="https://raw.githubusercontent.com/mashimomiku/code/master/image/081103.bmp">
PSNR値は１番良かった。また、ノイズ除去の工程と超解像を組み合わせただけだとPSNR値はどれも21[dB]程度であった。<br>
今のところ別の画像２種類でも同じような結果になった。<br>
<br>
3. まとめ<br>
結果は, 辞書学習型超解像 > バイキュービック法 > ウェーブレット変換を用いた超解像。<br>
ノイズを含んだ画像に対しノイズ除去も含めた超解像を考える時は、ウェーブレット変換を用いた超解像が試した中だとPSNR値が1番良かった。
<br>
やること<ul>
  <li>PSNR以外の評価方法   </li>
  <li>追加実験(マイクロCT画像とかも)  </li>
  <li>やり方を変える？         </li>
  <li>辞書に学習させる画像を変える       </li>
</ul>

