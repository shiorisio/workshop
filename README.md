
----------

Haruo Suzuki (haruo[at]g-language[dot]org)  
Last Update: 2016-04-26  

----------

# Microbial Genome Sequence Analysis
微生物ゲノム配列解析

## Updates

### 2016-04-26

Pan-genome解析の演習

Rスクリプト`scripts/test_gene_content.R`は、gene content（遺伝子の有無）データ行列を作成し、Pan-genome解析（共有遺伝子、ベン図、クラスター分析）を行なう。Rスクリプトの実行例は以下の通り:  

    Rscript --vanilla scripts/test_gene_content.R

![http://www.ncbi.nlm.nih.gov/pmc/articles/PMC4765519/figure/F1/](https://github.com/haruosuz/mgsa/blob/master/images/CG-16-245_F1.jpg)

[Venn diagram plot that represents the three parts of the pan-genome. In gray: core genome; yellow: accessory or dispensable genome, and blue: species-specific or strain-specific genes. Adapted: Muzzi et al., 2007.](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC4765519/figure/F1/)

### 2016-04-19

微生物ゲノム解析の概要

- 参考文献
 - [Tools for bacterial comparative genomics | Holt Lab](http://holtlab.net/2015/02/25/tools-for-bacterial-comparative-genomics/)
 - [Inside the Pan-genome - Methods and Software Overview. Curr Genomics. 2015 Aug](http://www.ncbi.nlm.nih.gov/pubmed/27006628)
 - [A brief review of software tools for pangenomics. Genomics Proteomics Bioinformatics. 2015 Feb](http://www.ncbi.nlm.nih.gov/pubmed/25721608)
 - [ITEP: an integrated toolkit for exploration of microbial pan-genomes. BMC Genomics. 2014 Jan](http://www.ncbi.nlm.nih.gov/pubmed/24387194)
 - [Computing for Comparative Microbial Genomics, Springer, 2009, 270p.](http://link.springer.com/book/10.1007%2F978-1-84800-255-5)

----------

## References
- [SFC 2015年度 秋学期 基礎バイオインフォマティクス](https://github.com/haruosuz/introBI)
 - [R言語入門](https://dl.dropboxusercontent.com/u/33495171/introBI/2015-11-11/README.md.html)
- [SFC 2016年度 春学期 生命動態のデータサイエンス](https://github.com/haruosuz/DS4GD)
 - [Rを用いたデータの解析と可視化](https://dl.dropboxusercontent.com/u/33495171/DS4GD/BBS.md.html#chapter-4-analysis-and-visualisation-of-data-using-r)

- Tools for bacterial comparative genomics | Holt Lab http://holtlab.net/2015/02/25/tools-for-bacterial-comparative-genomics/
 - Bacterial genomics tutorial | Holt Lab https://holtlab.net/2014/12/27/bacterial-genomics-tutorial-2/
 - Bacterial genomics tutorial | BacPathGenomics https://bacpathgenomics.wordpress.com/2013/04/13/bacterial-genomics-tutorial/
 - Beginner's guide to comparative bacterial genome analysis using next-generation sequence data. Microb Inform Exp. 2013. http://www.ncbi.nlm.nih.gov/pubmed/23575213

- Ten years of pan-genome analyses. Curr Opin Microbiol. 2015 Feb http://www.ncbi.nlm.nih.gov/pubmed/25483351

- rarefaction curve
 - plot - accumulation curve in R - Stack Overflow http://stackoverflow.com/questions/21615628/accumulation-curve-in-r
 - Vegan: ecological diversity https://cran.r-project.org/web/packages/vegan/vignettes/diversity-vegan.pdf
 - Gene accumulation curves in R | smoke&umami http://smokeandumami.com/2010/01/21/gene-accumulation-curves-in-r/
 - 自前でrarefactionカーブ in R http://tullbergia.at.webry.info/201009/article_3.html
 - 自前でrarefactionカーブ in R vol.2: マルチコア対応 http://tullbergia.at.webry.info/201111/article_1.html
 - データ解析｜種多様性の測定｜希薄化曲線(rarefaction curves)｜上の計算を R で行うためのコード http://www.lab2.toho-u.ac.jp/sci/bio/theoeco/wiki/index.php?plugin=attach&pcmd=open&file=jissyusyo_DA.pdf&refer=2013%CC%EE%B3%B0%C0%B8%C2%D6%B3%D8%BC%C2%BD%ACI

![https://en.wikipedia.org/wiki/Rarefaction_(ecology)](https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Sogin-Huber-CombinedRarefac.jpg/220px-Sogin-Huber-CombinedRarefac.jpg)

- de Bruijn Graph
 - [de Bruijn Graph を使った de novo アセンブリの発想がすごい件 - ほくそ笑む](http://d.hatena.ne.jp/hoxo_m/20100930/p1)
 - [CLCバイオジャパン - De Novo アセンブリ](http://www.clcbio.co.jp/fileadmin/user_upload/Mari/DeNovo_6.5.pdf)
 - ["de Bruijn"はどう発音する？ - Wolfeyes Bioinformatics beta](http://yagays.github.io/blog/2013/08/01/de-bruijn-pronounce/)
 - [de Bruijn graphを使ったアセンブラーのヘテロなサイトの取り扱いについて - #LSQA](http://qa.lifesciencedb.jp/questions/623/de-bruijn-graphを使ったアセンブラーのヘテロなサイトの取り扱いについて) 質問日 Aug 31 '12

----------

## Scripts

The shell script `scripts/run.sh` automatically carries out the entire steps: creating subdirectories, downloading data files, and running the R scripts.

Let's run the driver script in the project's main directory `mgsa/` with:

    bash scripts/run.sh > log.txt 2>&1 &

## Step

Created the project directory using `mkdir -p ./{data,scripts,analysis}`

	mv Rplots.pdf table.csv analysis/

マイコプラズマ菌（Mycoplasma genitalium）のコンプリートゲノム配列の取得方法

プロジェクト・ディレクトリを作成し移動:  

    mkdir -p ~/projects/mgsa/data
    cd ~/projects/mgsa/data

"Mycoplasma genitalium"のゲノム配列データのFTPディレクトリパス（URL）を記載したファイルを`wget`でダウンロードする:  

    wget ftp://ftp.ncbi.nlm.nih.gov/genomes/genbank/bacteria/Mycoplasma_genitalium/assembly_summary.txt

または

    wget ftp://ftp.ncbi.nlm.nih.gov/genomes/refseq/bacteria/Mycoplasma_genitalium/assembly_summary.txt

ゲノム配列解読の状況 Status (`assembly_level`) を確認:  

    head -n 1 assembly_summary.txt | cut -f12
    grep -v '^#' assembly_summary.txt | cut -f12 | sort | uniq -c

出力例:  

    assembly_level
       5 Complete Genome
       1 Contig

"Complete Genome"のデータ最新版（`version_status = latest`）のURLを抽出する:  

    ftpdirpaths=($(awk -F "\t" '$12=="Complete Genome" && $11=="latest"{print $20}' assembly_summary.txt))

または

    ftpdirpaths=($(grep "latest.*Complete Genome" assembly_summary.txt | cut -f20))

抽出されたURLの数を確認する:  

    echo ${#ftpdirpaths[@]}
    echo ${ftpdirpaths[@]}

データの圧縮ファイル（.fna.gz,.faa.gz）を`wget`でダウンロードする:  

    for URL in ${ftpdirpaths[@]}
    do
      wget -nv $URL/{*.fna.gz,*.faa.gz}
    done

`gunzip`コマンドで解凍:  

    gunzip *.gz

参考:
https://github.com/haruosuz/mgen
ケーススタディ https://dl.dropboxusercontent.com/u/33495171/introBI/CaseStudy.md.html NCBI assembly summary

----------

- Genomes Download FAQ
 - [12. How can I download RefSeq data for all complete bacterial genomes?](http://www.ncbi.nlm.nih.gov/genome/doc/ftpfaq/#allcomplete)
 - [9. How can I find the sequence and annotation of my genome of interest?](http://www.ncbi.nlm.nih.gov/genome/doc/ftpfaq/#howtofind) Using the assembly summary files for bacteria or a species under genbank or refseq
  - ftp://ftp.ncbi.nlm.nih.gov/genomes/genbank/bacteria/assembly_summary.txt
  - ftp://ftp.ncbi.nlm.nih.gov/genomes/refseq/bacteria/assembly_summary.txt
  - ftp://ftp.ncbi.nlm.nih.gov/genomes/genbank/bacteria/Mycoplasma_genitalium/assembly_summary.txt
  - ftp://ftp.ncbi.nlm.nih.gov/genomes/refseq/bacteria/Mycoplasma_genitalium/assembly_summary.txt

- Genomic nucleotide composition
 - [Database of genomic compositional skews](http://www.g-language.org/data/oriter/)
 - [Trends Microbiol. 2001 Jul;9(7):335-43. Detecting anomalous gene clusters and pathogenicity islands in diverse bacterial genomes.](http://www.ncbi.nlm.nih.gov/pubmed/11435108)

----------

### Inspecting Data

    cd data/
    ls -lh
    # Working with Gzipped Compressed Files using gzcat, zgrep, and zless
    gzcat *.fna.gz | head -n 2
    zgrep -c '^>' *.gz
    zless *.faa.gz

----------
