
Skip to content

    Pull requests
    Issues
    Marketplace
    Explore

    @brunof17

0
1

    0

a82088/CP
Code
Issues 0
Pull requests 0
Projects 0
Wiki
Insights

caputa de cena

    master 

@MelhorQueSVN
MelhorQueSVN committed 19 hours ago
1 parent 1b6f07a commit 272c2c6f7be4ba681b60fa25c99140b1a77b55c4
Showing
with 2,100 additions and 0 deletions.
2,100 cp1718t/cp1718t.lhs
@@ -0,0 +1,2100 @@
+\documentclass[a4paper]{article}
+\usepackage[a4paper,left=3cm,right=2cm,top=2.5cm,bottom=2.5cm]{geometry}
+\usepackage{palatino}
+\usepackage[colorlinks=true,linkcolor=blue,citecolor=blue]{hyperref}
+\usepackage{graphicx}
+\usepackage{cp1718t}
+\usepackage{subcaption}
+\usepackage{adjustbox}
+\usepackage[T1]{fontenc}
+\usepackage{float}
+%================= lhs2tex=====================================================%
+%include polycode.fmt
+%format (cata g) = "\cata{" g "}"
+%format (ana g) = "\ana{" g "}"
+%format (hylo h g) = "\hylo{" h g "}"
+%format (cataBlockchain g) = "\cata{" g "}"
+%format (anaBlockchain g) = "\ana{" g "}"
+%format (cataQTree g) = "\cata{" g "}"
+%format (anaQTree g) = "\ana{" g "}"
+%format (cataList g) = "\cata{" g "}"
+%format (anaList g) = "\ana{" g "}"
+%format (div (x)(y)) = x "\div " y
+%format succ = "\succ "
+%format ==> = "\Longrightarrow "
+%format map = "\map "
+%format length = "\length "
+%format fst = "\p1"
+%format p1  = "\p1"
+%format snd = "\p2"
+%format p2  = "\p2"
+%format Left = "i_1"
+%format Right = "i_2"
+%format i1 = "i_1"
+%format i2 = "i_2"
+%format >< = "\times"
+%format >|<  = "\bowtie "
+%format |-> = "\mapsto"
+%format . = "\comp "
+%format (kcomp (f)(g)) = f "\kcomp " g
+%format -|- = "+"
+%format conc = "\mathsf{conc}"
+%format summation = "{\sum}"
+%format (either (a) (b)) = "\alt{" a "}{" b "}"
+%format (frac (a) (b)) = "\frac{" a "}{" b "}"
+%format (uncurry f) = "\uncurry{" f "}"
+%format (const f) = "\underline{" f "}"
+%format TLTree = "\mathsf{TLTree}"
+%format (lcbr (x)(y)) = "\begin{lcbr}" x "\\" y "\end{lcbr}"
+%format (split (x) (y)) = "\conj{" x "}{" y "}"
+%format for f i = "\mathsf{for}\ " f "\ " i
+%format B_tree = "\mathsf{B}\mbox{-}\mathsf{tree} "
+\def\ana#1{\mathopen{[\!(}#1\mathclose{)\!]}}
+%format (cataA (f) (g)) = "\cata{" f "~" g "}_A"
+%format (anaA (f) (g)) = "\ana{" f "~" g "}_A"
+%format (cataB (f) (g)) = "\cata{" f "~" g "}_B"
+%format (anaB (f) (g)) = "\ana{" f "~" g "}_B"
+%format Either a b = a "+" b 
+%format fmap = "\mathsf{fmap}"
+%format NA   = "\textsc{na}"
+%format NB   = "\textsc{nb}"
+%format inT = "\mathsf{in}"
+%format outT = "\mathsf{out}"
+%format Null = "1"
+%format (Prod (a) (b)) = a >< b
+%format fF = "\fun F "
+%format e1 = "e_1 "
+%format e2 = "e_2 "
+%format Dist = "\fun{Dist}"
+%format IO = "\fun{IO}"
+%format BTree = "\fun{BTree} "
+%format LTree = "\mathsf{LTree}"
+%format inNat = "\mathsf{in}"
+%format (cataNat (g)) = "\cata{" g "}"
+%format Nat0 = "\N_0"
+%format muB = "\mu "
+%format (frac (n)(m)) = "\frac{" n "}{" m "}"
+%format (fac (n)) = "{" n "!}"
+%format (underbrace (t) (p)) = "\underbrace{" t "}_{" p "}"
+%format matrix = "matrix"
+%format (bin (n) (k)) = "\Big(\vcenter{\xymatrix@R=1pt{" n "\\" k "}}\Big)"
+%format `ominus` = "\mathbin{\ominus}"
+%format % = "\mathbin{/}"
+%format <-> = "{\,\leftrightarrow\,}"
+%format <|> = "{\,\updownarrow\,}"
+%format `minusNat`= "\mathbin{-}"
+%format ==> = "\Rightarrow"
+%format .==>. = "\Rightarrow"
+%format .<==>. = "\Leftrightarrow"
+%format .==. = "\equiv"
+%format .<=. = "\leq"
+
+%---------------------------------------------------------------------------
+
+\title{
+            Cálculo de Programas
+\\
+        Trabalho Prático
+\\
+        MiEI+LCC --- 2017/18
+}
+
+\author{
+        \dium
+\\
+        Universidade do Minho
+}
+
+
+\date\mydate
+
+\makeindex
+
+\begin{document}
+
+\maketitle
+
+\begin{center}\large
+\begin{tabular}{ll}
+\textbf{Grupo} nr. & 109
+\\\hline
+a82088 & Luís Tiago Machado Braga
+\\
+a82300 & João Filipe da Costa Nunes
+\\
+a82298 & Luís Guilherme Gonçalves Macedo da Silva Martins
+\end{tabular}
+\end{center}
+
+\section{Preâmbulo}
+
+A disciplina de \CP\ tem como objectivo principal ensinar
+a progra\-mação de computadores como uma disciplina científica. Para isso
+parte-se de um repertório de \emph{combinadores} que formam uma álgebra da
+programação (conjunto de leis universais e seus corolários) e usam-se esses
+combinadores para construir programas \emph{composicionalmente}, isto é,
+agregando programas já existentes.
+  
+Na sequência pedagógica dos planos de estudo dos dois cursos que têm esta
+disciplina, restringe-se a aplicação deste método à programação funcional
+em \Haskell. Assim, 
+o presente trabalho prático coloca os alunos perante problemas
+concretos que deverão ser implementados em \Haskell.
+Há ainda um outro objectivo: o de ensinar a documentar programas e
+a produzir textos técnico-científicos de qualidade.
+
+\section{Documentação}
+Para cumprir de forma integrada os objectivos enunciados acima vamos recorrer
+a uma técnica de programa\-ção dita ``\litp{literária}'' \cite{Kn92}, cujo
+princípio base é o seguinte:
+\begin{quote}\em
+Um programa e a sua documentação devem coincidir.
+\end{quote}
+Por outras palavras, o código fonte e a documentação de um programa deverão estar no
+mesmo ficheiro.
+
+O ficheiro \texttt{cp1718t.pdf} que está a ler é já um exemplo de \litp{programação
+literária}: foi gerado a partir do texto fonte \texttt{cp1718t.lhs}\footnote{O
+suffixo `lhs' quer dizer \emph{\lhaskell{literate Haskell}}.} que encontrará
+no \MaterialPedagogico\ desta disciplina descompactando o ficheiro \texttt{cp1718t.zip}
+e executando
+\begin{Verbatim}[fontsize=\small]
+    $ lhs2TeX cp1718t.lhs > cp1718t.tex
+    $ pdflatex cp1718t
+\end{Verbatim}
+em que \href{https://hackage.haskell.org/package/lhs2tex}{\texttt\LhsToTeX} é
+um pre-processador que faz ``pretty printing''
+de código Haskell em \Latex\ e que deve desde já instalar executando
+\begin{Verbatim}[fontsize=\small]
+    $ cabal install lhs2tex
+\end{Verbatim}
+Por outro lado, o mesmo ficheiro \texttt{cp1718t.lhs} é executável e contém
+o ``kit'' básico, escrito em \Haskell, para realizar o trabalho. Basta executar
+\begin{Verbatim}[fontsize=\small]
+    $ ghci cp1718t.lhs
+\end{Verbatim}
+
+%if False
+\begin{code}
+{-# LANGUAGE GeneralizedNewtypeDeriving, DeriveDataTypeable #-}
+import Cp
+import List  hiding (fac)
+import Nat  
+import Probability hiding (cond)
+import BMP
+
+import Data.List
+import Data.Typeable
+import Data.Ratio
+import Data.Bifunctor
+import Data.Maybe
+import Data.Matrix hiding ((!))
+import Test.QuickCheck hiding ((><),choose)
+import qualified Test.QuickCheck as QuickCheck
+import System.Random  hiding (split)
+import GHC.IO.Exception
+import Codec.Picture.Types
+import Graphics.Gloss
+import Control.Monad
+import Control.Applicative hiding ((<|>))
+\end{code}
+%endif
+
+\noindent Abra o ficheiro \texttt{cp1718t.lhs} no seu editor de texto preferido
+e verifique que assim é: todo o texto que se encontra dentro do ambiente
+\begin{quote}\small\tt
+\verb!\begin{code}!
+\\ ... \\
+\verb!\end{code}!
+\end{quote}
+vai ser seleccionado pelo \GHCi\ para ser executado.
+
+\section{Como realizar o trabalho}
+Este trabalho teórico-prático deve ser realizado por grupos de três alunos.
+Os detalhes da avaliação (datas para submissão do relatório e sua defesa
+oral) são os que forem publicados na \cp{página da disciplina} na \emph{internet}.
+
+Recomenda-se uma abordagem participativa dos membros do grupo
+de trabalho por forma a poderem responder às questões que serão colocadas
+na \emph{defesa oral} do relatório.
+
+Em que consiste, então, o \emph{relatório} a que se refere o parágrafo anterior?
+É a edição do texto que está a ser lido, preenchendo o anexo \ref{sec:resolucao}
+com as respostas. O relatório deverá conter ainda a identificação dos membros
+do grupo de trabalho, no local respectivo da folha de rosto.
+
+Para gerar o PDF integral do relatório deve-se ainda correr os comando seguintes,
+que actualizam a bibliografia (com \Bibtex) e o índice remissivo (com \Makeindex),
+\begin{Verbatim}[fontsize=\small]
+    $ bibtex cp1718t.aux
+    $ makeindex cp1718t.idx
+\end{Verbatim}
+e recompilar o texto como acima se indicou. Dever-se-á ainda instalar o utilitário
+\QuickCheck,
+que ajuda a validar programas em \Haskell, a biblioteca
+\href{https://hackage.haskell.org/package/JuicyPixels}{JuicyPixels} para processamento
+de imagens e a biblioteca \href{http://gloss.ouroborus.net/}{gloss} para geração de gráficos 2D:
+\begin{Verbatim}[fontsize=\small]
+    $ cabal install QuickCheck JuicyPixels gloss
+\end{Verbatim}
+Para testar uma propriedade \QuickCheck~|prop|, basta invocá-la com o comando:
+\begin{verbatim}
+    > quickCheck prop
+    +++ OK, passed 100 tests.
+\end{verbatim}
+
+\section*{Problema 1}
+
+Segundo uma \href{https://www.jn.pt/economia/interior/compra-diaria-de-bitcoins-iguala-acoes-da-apple-9257302.html}{notícia do Jornal de Notícias}, 
+referente ao dia 12 de abril, \emph{``apenas numa hora, foram transacionadas 1.2 mil milhões de dólares em bitcoins. Nas últimas 24 horas, foram transacionados 8,5 mil milhões de dólares, num total de 24 mil milhões de dólares referentes às principais criptomoedas''}.
+
+De facto, é inquestionável que as criptomoedas, e em particular as bitcoin, vieram para ficar.
+%
+Várias moedas digitais, e em particular as bitcoin, usam a tecnologia de block chain
+para guardar e assegurar todas as transações relacionadas com a moeda.
+%
+Uma \href{https://en.bitcoin.it/wiki/Block_chain}{block chain} é uma coleção de blocos que registam os movimentos da moeda; a sua definição em Haskell é apresentada de seguida.
+
+\begin{spec}
+data Blockchain = Bc {bc :: Block}  |  Bcs {bcs :: (Block, Blockchain)} deriving Show
+\end{spec}
+
+Cada \href{https://en.bitcoin.it/wiki/Block}{bloco} numa block chain
+regista um número (mágico) único, o momento da execução, e uma lista de transações,
+tal como no código seguinte:
+
+\begin{spec}
+type Block = (MagicNo, (Time, Transactions))
+\end{spec}
+
+Cada \href{https://en.bitcoin.it/wiki/Transaction}{transação} 
+define a entidade de origem da transferência, o valor a ser transacionado,
+e a entidade destino (por esta ordem), tal como se define de seguida.
+
+\begin{spec}
+type Transaction = (Entity, (Value, Entity))
+type Transactions = [Transaction]
+\end{spec}
+
+A partir de uma block chain, é possível calcular o valor que cada entidade
+detém, tipicamente designado de ledger:
+
+\begin{spec}
+type Ledger = [(Entity, Value)]
+\end{spec}
+
+Seguem as restantes definições Haskell para completar o código anterior.
+Note que |Time| representa o momento da transação, como o número de \href{https://currentmillis.com}{milisegundos} que passaram desde 1970.
+
+\begin{spec}
+type MagicNo = String
+type Time = Int  -- em milisegundos
+type Entity = String
+type Value = Int
+\end{spec}
+
+Neste contexto, implemente as seguintes funções:
+
+\begin{enumerate}
+\item Defina a função |allTransactions :: Blockchain -> Transactions|, como um catamorfismo, que calcula a lista com todas as transações numa dada block chain.
+
+%if False
+\begin{code}
+allTransactions :: Blockchain -> Transactions
+prop1a :: Blockchain -> Bool
+\end{code}
+%endif
+
+\begin{propriedade}
+    As transações de uma block chain são as mesmas da block chain revertida:
+\begin{code}
+prop1a = sort . allTransactions .==. sort . allTransactions . reverseChain
+\end{code}
+
+Note que a função |sort| é usada apenas para facilitar a comparação das listas.
+\end{propriedade}
+
+\item Defina a função |ledger :: Blockchain -> Ledger|, utilizando catamorfismos e/ou anamorfismos, que calcula o ledger (i.e., o valor disponível) de cada entidade numa uma dada block chain.
+    Note que as entidades podem ter valores negativos; de facto isso acontecerá para a primeira transação que executarem.
+
+%if False
+\begin{code}
+ledger :: Blockchain -> Ledger
+prop1b :: Blockchain -> Bool
+prop1c :: Blockchain -> Bool
+\end{code}
+%endif
+
+\begin{propriedade}
+    O tamanho do ledger é inferior ou igual a duas vezes o tamanho de todas as transações:
+\begin{code}
+prop1b = length . ledger .<=. (2*) . length . allTransactions
+\end{code}
+\end{propriedade}
+
+\begin{propriedade}
+    O ledger de uma block chain é igual ao ledger da sua inversa:
+\begin{code}
+prop1c = sort . ledger .==. sort . ledger . reverseChain
+\end{code}
+\end{propriedade}
+
+
+
+\item Defina a função |isValidMagicNr :: Blockchain -> Bool|, utilizando catamorfismos e/ou anamorfismos, que verifica se todos os números mágicos numa dada block chain são únicos.
+
+%if False
+\begin{code}
+isValidMagicNr :: Blockchain -> Bool
+prop1d :: Blockchain -> Bool
+prop1e :: Blockchain -> Property
+\end{code}
+%endif
+
+\begin{propriedade}
+    A concatenação de uma block chain com ela mesma nunca é válida em termos de números mágicos:
+\begin{code}
+prop1d = not . isValidMagicNr . concChain . (split id id)
+\end{code}
+\end{propriedade}
+
+\begin{propriedade}
+    Se uma block chain é válida em termos de números mágicos, então a sua inversa também o é:
+\begin{code}
+prop1e = isValidMagicNr .==>. isValidMagicNr . reverseChain
+\end{code}
+\end{propriedade}
+
+\end{enumerate}
+
+
+
+\section*{Problema 2}
+
+Uma estrutura de dados frequentemente utilizada para representação e processamento de imagens de forma eficiente são as denominadas \href{https://en.wikipedia.org/wiki/Quadtree}{quadtrees}.
+Uma \emph{quadtree} é uma árvore quaternária em que cada nodo tem quatro sub-árvores e cada folha representa um valor bi-dimensional.
+\begin{spec}
+data QTree a = Cell a Int Int | Block (QTree a) (QTree a) (QTree a) (QTree a)
+  deriving (Eq,Show)
+\end{spec}
+
+\begin{figure}
+\begin{subfigure}{0.3\textwidth}
+\begin{verbatim}
+( 0 0 0 0 0 0 0 0 )
+( 0 0 0 0 0 0 0 0 )
+( 0 0 0 0 1 1 1 0 )
+( 0 0 0 0 1 1 0 0 )
+( 1 1 1 1 1 1 0 0 )
+( 1 1 1 1 1 1 0 0 )
+( 1 1 1 1 0 0 0 0 )
+( 1 1 1 1 0 0 0 1 )
+\end{verbatim}
+\caption{Matriz de exemplo |bm|.}
+\label{fig:bm}
+\end{subfigure}
+\begin{subfigure}{0.7\textwidth}
+\begin{verbatim}
+Block
+ (Cell 0 4 4) (Block
+  (Cell 0 2 2) (Cell 0 2 2) (Cell 1 2 2) (Block
+   (Cell 1 1 1) (Cell 0 1 1) (Cell 0 1 1) (Cell 0 1 1)))
+ (Cell 1 4 4)
+ (Block
+  (Cell 1 2 2) (Cell 0 2 2) (Cell 0 2 2) (Block
+   (Cell 0 1 1) (Cell 0 1 1) (Cell 0 1 1) (Cell 1 1 1)))
+\end{verbatim}
+\caption{Quadtree de exemplo |qt|.}
+\label{fig:qt}
+\end{subfigure}
+\caption{Exemplos de representações de bitmaps.}
+\end{figure}
+
+Uma imagem monocromática em formato bitmap pode ser representada como uma
+matriz de bits\footnote{Cf.\ módulo \href{https://hackage.haskell.org/package/matrix}{|Data.Matrix|}.},
+tal como se exemplifica na Figura~\ref{fig:bm}.
+
+O anamorfismo |bm2qt| converte um bitmap em forma matricial na sua codificação eficiente em quadtrees, e o catamorfismo |qt2bm| executa a operação inversa:
+
+\adjustbox{valign=t}{\begin{minipage}{.5\textwidth} %
+\begingroup
+\leftskip-1.5em
+\rightskip\leftskip
+\begin{code}
+bm2qt :: (Eq a) => Matrix a -> QTree a
+bm2qt = anaQTree f where
+    f m = if one then i1 u else i2 (a,(b,(c,d)))
+     where  x = (nub . toList) m
+            u = (head x,(ncols m,nrows m))
+            one = (ncols m == 1 || nrows m == 1 || length x == 1)
+            (a,b,c,d) = splitBlocks (nrows m `div` 2) (ncols m `div` 2) m    
+\end{code}
+\endgroup
+\end{minipage}} %
+\adjustbox{valign=t}{\begin{minipage}{.5\textwidth} %
+\begingroup
+\leftskip-2em
+\rightskip\leftskip
+\begin{code}
+qt2bm :: (Eq a) => QTree a -> Matrix a
+qt2bm = cataQTree (either f g) where
+    f (k,(i,j)) = matrix j i (const k)
+    g (a,(b,(c,d))) = (a <|> b) <-> (c <|> d)
+\end{code}
+\endgroup
+\end{minipage}}
+
+O algoritmo |bm2qt| particiona recursivamente a imagem em $4$ blocos e termina produzindo folhas para matrizes unitárias ou quando todos os píxeis de um sub-bloco têm a mesma côr.
+Para a matriz |bm| de exemplo, a quadtree correspondente |qt = bm2qt bm| é ilustrada na Figura~\ref{fig:qt}.
+
+\begin{figure}
+%
+\begin{subfigure}{0.5\textwidth}
+\centering
+\includegraphics[width=0.2\linewidth]{cp1718t_media/person.png}
+\caption{Bitmap de exemplo.}
+\label{fig:person}
+\end{subfigure}
+%
+\begin{subfigure}{0.5\textwidth}
+\centering
+\includegraphics[height=0.2\linewidth]{cp1718t_media/person90.png}
+\caption{Rotação.}
+\label{fig:person90}
+\end{subfigure}
+%
+\begin{subfigure}{0.5\textwidth}
+\centering
+\includegraphics[width=0.4\linewidth]{cp1718t_media/personx2.png}
+\caption{Redimensionamento.}
+\label{fig:personx2}
+\end{subfigure}
+%
+\begin{subfigure}{0.5\textwidth}
+\centering
+\includegraphics[width=0.2\linewidth]{cp1718t_media/personinv.png}
+\caption{Inversão de cores.}
+\label{fig:personinv}
+\end{subfigure}
+%
+\begin{subfigure}{0.5\textwidth}
+\centering
+\includegraphics[width=0.2\linewidth]{cp1718t_media/person1.png}
+\caption{Compresão de $1$ nível.}
+\label{fig:person1}
+\end{subfigure}
+%
+\begin{subfigure}{0.5\textwidth}
+\centering
+\includegraphics[width=0.2\linewidth]{cp1718t_media/person2.png}
+\caption{Compresão de $2$ níveis.}
+\label{fig:person2}
+\end{subfigure}
+%
+\begin{subfigure}{0.5\textwidth}
+\centering
+\includegraphics[width=0.2\linewidth]{cp1718t_media/person3.png}
+\caption{Compresão de $3$ níveis.}
+\label{fig:person3}
+\end{subfigure}
+%
+\begin{subfigure}{0.5\textwidth}
+\centering
+\includegraphics[width=0.2\linewidth]{cp1718t_media/person4.png}
+\caption{Compresão de $4$ níveis.}
+\label{fig:person4}
+\end{subfigure}
+%
+\begin{subfigure}{0.5\textwidth}
+\centering
+\includegraphics[width=0.2\linewidth]{cp1718t_media/personOut1.png}
+\caption{Bitmap de contorno.}
+\label{fig:personOut1}
+\end{subfigure}
+%
+\begin{subfigure}{0.5\textwidth}
+\centering
+\includegraphics[width=0.2\linewidth]{cp1718t_media/personOut2.png}
+\caption{Bitmap com contorno.}
+\label{fig:personOut2}
+\end{subfigure}
+%
+\caption{Manipulação de uma figura bitmap utilizando quadtrees.}
+\end{figure}
+
+Imagens a cores podem ser representadas como matrizes de píxeis segundo o código de cores \href{https://en.wikipedia.org/wiki/RGBA_color_space}{RGBA}, codificado no tipo \href{https://hackage.haskell.org/package/JuicyPixels-3.2.9.5/docs/Codec-Picture.html#t:PixelRGBA8}{|PixelRGBA8|} em que cada pixel é um quádruplo de valores inteiros $(red,green,blue,alpha)$ contidos entre $0$ e $255$.
+Atente em alguns exemplos de cores:
+\begin{spec}
+whitePx  = PixelRGBA8 255 255 255 255
+blackPx  = PixelRGBA8 0 0 0 255
+redPx    = PixelRGBA8 255 0 0 255
+\end{spec}
+
+O módulo |BMP|, disponibilizado juntamente com o enunciado, fornece funções para processar ficheiros de imagem bitmap como matrizes:
+\begin{spec}
+    readBMP :: FilePath -> IO (Matrix PixelRGBA8)
+    writeBMP :: FilePath -> Matrix PixelRGBA8 -> IO ()
+\end{spec}
+
+Teste, por exemplo, no |GHCi|, carregar a Figura~\ref{fig:person}:
+\begin{verbatim}
+    > readBMP "cp1718t_media/person.bmp"
+\end{verbatim} 
+
+Esta questão aborda operações de processamento de imagens utilizando quadtrees:
+\begin{enumerate}
+    \item Defina as funções |rotateQTree :: QTree a -> QTree a|, |scaleQTree :: Int -> QTree a -> QTree a| e |invertQTree :: QTree a -> QTree a|, como catamorfismos e/ou anamorfismos, que rodam\footnote{Segundo um ângulo de $90º$ no sentido dos ponteiros do relógio.}, redimensionam \footnote{Multiplicando o seu tamanho pelo valor recebido.} e invertem as cores de uma quadtree\footnote{Um pixel pode ser invertido calculando $255 - c$ para cada componente $c$ de cor RGB, exceptuando o componente alpha.}, respectivamente.
+    Tente produzir imagens similares às Figuras~\ref{fig:person90}, \ref{fig:personx2} e \ref{fig:personinv}:
+%if False
+\begin{code}
+rotateQTree :: QTree a -> QTree a
+scaleQTree :: Int -> QTree a -> QTree a
+invertQTree :: QTree PixelRGBA8 -> QTree PixelRGBA8
+prop2c :: QTree Int -> Bool
+prop2d :: Nat -> QTree Int -> Bool
+prop2e :: QTree PixelRGBA8 -> Bool
+\end{code}
+%endif
+        \begin{verbatim}
+    > rotateBMP  "cp1718t_media/person.bmp" "person90.bmp"
+    > scaleBMP 2 "cp1718t_media/person.bmp" "personx2.bmp"
+    > invertBMP  "cp1718t_media/person.bmp" "personinv.bmp"
+        \end{verbatim}
+
+\begin{propriedade}
+        Rodar uma quadtree é equivalente a rodar a matriz correspondente:
+\begin{code}
+prop2c = rotateMatrix . qt2bm .==. qt2bm . rotateQTree
+\end{code}
+    \end{propriedade}
+\begin{propriedade}
+    Redimensionar uma imagem altera o seu tamanho na mesma proporção:
+\begin{code}
+prop2d (Nat s) = sizeQTree . scaleQTree s .==. ((s*) >< (s*)) . sizeQTree
+\end{code}
+\end{propriedade}
+\begin{propriedade}
+    Inverter as cores de uma quadtree preserva a sua estrutura:
+\begin{code}
+prop2e = shapeQTree . invertQTree .==. shapeQTree
+\end{code}
+\end{propriedade}
+    
+    \item Defina a função |compressQTree :: Int -> QTree a -> QTree a|, utilizando catamorfismos e/ou anamorfismos, que comprime uma quadtree cortando folhas da árvore para reduzir a sua profundidade num dado número de níveis.
+    Tente produzir imagens similares (mas não necessariamente iguais) às Figuras~\ref{fig:person1}, \ref{fig:person2}, \ref{fig:person3} e \ref{fig:person4}:
+%if False
+\begin{code}
+compressQTree :: Int -> QTree a -> QTree a
+prop2f :: Nat -> QTree Int -> Bool
+\end{code}
+%endif
+        \begin{verbatim}
+    > compressBMP 1 "cp1718t_media/person.bmp" "person1.bmp"
+    > compressBMP 2 "cp1718t_media/person.bmp" "person2.bmp"
+    > compressBMP 3 "cp1718t_media/person.bmp" "person3.bmp"
+    > compressBMP 4 "cp1718t_media/person.bmp" "person4.bmp"
+        \end{verbatim}
+    \begin{propriedade}
+        A quadtree comprimida tem profundidade igual à da quadtree original menos a taxa de compressão:
+\begin{code}
+prop2f (Nat n) = depthQTree . compressQTree n .==. (`minusNat` n) . depthQTree
+\end{code}
+    \end{propriedade}
+    
+
+    \item Defina a função |outlineQTree :: (a -> Bool) -> QTree a -> Matrix Bool|, utilizando catamorfismos e/ou anamorfismos, que recebe uma função que determina quais os píxeis de fundo e converte uma quadtree numa matriz monocromática, de forma a desenhar o contorno de uma \href{https://en.wikipedia.org/wiki/Polygon_mesh}{malha poligonal} contida na imagem.
+        Tente produzir imagens similares (mas não necessariamente iguais) às Figuras~\ref{fig:personOut1} e \ref{fig:personOut2}:
+%if False
+\begin{code}
+outlineQTree :: (a -> Bool) -> QTree a -> Matrix Bool
+\end{code}
+%endif
+            \begin{verbatim}
+    > outlineBMP    "cp1718t_media/person.bmp" "personOut1.bmp"
+    > addOutlineBMP "cp1718t_media/person.bmp" "personOut2.bmp"
+            \end{verbatim}
+%if False
+\begin{code}
+prop2g :: QTree Int -> Bool
+\end{code}
+%endif
+    \begin{propriedade}
+        A matriz de contorno tem dimensões iguais às da quadtree:
+\begin{code}
+prop2g = sizeQTree .==. sizeMatrix . outlineQTree (<0)
+\end{code}
+    \end{propriedade}
+    \begin{teste}
+        Contorno da quadtree de exemplo |qt|:
+\begin{code}
+teste2a = outlineQTree (==0) qt == qtOut 
+\end{code}
+    \end{teste}
+
+\end{enumerate}
+
+\section*{Problema 3}
+O cálculo das combinações de |n| |k|-a-|k|,
+\begin{eqnarray}
+    |bin n k = frac (fac n)(fac k * (fac ((n-k))))|
+    \label{eq:bin} 
+\end{eqnarray}
+envolve três factoriais. Recorrendo à \material{lei de recursividade múltipla} do cálculo
+de programas, é possível escrever o mesmo programa como um simples ciclo-for
+onde se fazem apenas multiplicações e somas. Para isso, começa-se por estruturar
+a definição dada da forma seguinte,
+\begin{eqnarray*}
+    |bin n k = h k (n - k)|
+\end{eqnarray*}
+onde
+\begin{eqnarray*}
+\start
+       |h k d = frac (f k d) (g d)|
+\more
+       |f k d = frac (fac ((d+k))) (fac k)|
+\more
+       |g d = fac d| 
+\end{eqnarray*}
+assumindo-se |d = n-k >=0|.
+%
+É fácil de ver que |f k| e |g| se desdobram em 4 funções mutuamente recursivas, a saber
+\begin{spec}
+f k 0 = 1
+f k (d+1) = underbrace ((d+k+1)) (l k d) * f k d
+
+l k 0 = k+1
+l k (d+1) = l k d + 1
+\end{spec}
+e 
+\begin{spec}
+g 0 = 1
+g (d+1) = underbrace ((d+1)) (s d) * g d
+
+s 0 = 1
+s (d+1) = s d + 1
+\end{spec}
+A partir daqui alguém derivou a seguinte implementação:
+\begin{code}
+bin n k = h k (n-k) where  h k n = let (a,_,b,_) = for loop (base k) n in a % b
+\end{code}
+Aplicando a lei da recursividade múltipla para |split (f k) (l k)| e para
+|split g s| e combinando os resultados com a \material{lei de banana-split},
+derive as funções |base k| e |loop| que são usadas como auxiliares acima.
+
+\begin{propriedade}
+Verificação que |bin n k| coincide com a sua especificação (\ref{eq:bin}):
+\begin{code}
+prop3 (NonNegative n) (NonNegative k) = k <= n ==> (bin n k) == (fac n) % (fac k * (fac ((n-k))))
+\end{code}
+\end{propriedade}
+
+\section*{Problema 4}
+
+\begin{figure}
+\begin{center}
+\includegraphics[width=0.7\textwidth]{cp1718t_media/pythagoras-tree1.png}
+\end{center}
+\caption{Passos de construção de uma árvore de Pitágoras de ordem $3$.}
+\label{fig:pitagoras1}
+\end{figure}
+
+\href{https://en.wikipedia.org/wiki/Fractal}{Fractais} são formas geométricas que podem ser construídas recursivamente de acordo com um conjunto de equações matemáticas.
+Um exemplo clássico de um fractal são as \href{https://en.wikipedia.org/wiki/Pythagoras_tree_(fractal)}{árvores de Pitágoras}.
+A construção de uma árvore de Pitágoras começa com um quadrado, ao qual se unem dois quadrados redimensionados pela escala $\sqrt{2}/2$, de forma a que os cantos dos $3$ quadrados coincidam e formem um triângulo rectângulo isósceles.
+Este procedimento é repetido recursivamente de acordo com uma dada ordem, definida como um número natural (Figura~\ref{fig:pitagoras1}).
+
+Uma árvore de Pitágoras pode ser codificada em Haskell como uma full tree contendo quadrados nos nodos e nas folhas, sendo um quadrado definido simplesmente pelo tamanho do seu lado:
+\begin{spec}
+data FTree a b = Unit b | Comp a (FTree a b) (FTree a b) deriving (Eq,Show)
+type PTree = FTree Square Square
+type Square = Float
+\end{spec}
+
+\begin{enumerate}
+    \item Defina a função |generatePTree :: Int -> PTree|, como um anamorfismo, que gera uma árvore de Pitágoras para uma dada ordem.
+
+%if False
+\begin{code}
+generatePTree :: Int -> PTree
+prop4a :: SmallNat -> Bool
+prop4b :: SmallNat -> Bool
+\end{code}
+%endif
+
+\begin{propriedade}
+    Uma árvore de Pitágoras tem profundidade igual à sua ordem:
+\begin{code}
+prop4a (SmallNat n) = (depthFTree . generatePTree) n == n
+\end{code}
+\end{propriedade}
+\begin{propriedade}
+    Uma árvore de Pitágoras está sempre balanceada:
+\begin{code}
+prop4b (SmallNat n) = (isBalancedFTree . generatePTree) n
+\end{code}
+\end{propriedade}
+
+\item Defina a função |drawPTree :: PTree -> [Picture]|, utilizando catamorfismos e/ou anamorfismos, que anima incrementalmente os passos de construção de uma árvore de Pitágoras recorrendo à biblioteca \href{https://hackage.haskell.org/package/gloss}{gloss}.
+    Anime a sua solução:
+\begin{verbatim}
+    > animatePTree 3
+\end{verbatim}
+
+%if False
+\begin{code}
+drawPTree :: PTree -> [Picture]
+
+window = (InWindow "Phytagoras Tree" (800,800) (500,100))
+square s = rectangleSolid s s
+
+animatePTree n = animate window (dark white) draw
+    where
+    pics = drawPTree (generatePTree n)
+    draw t = pics !! (floor (t/2))
+\end{code}
+%endif
+    
+\end{enumerate}
+
+\section*{Problema 5}
+
+Uma das áreas em maior expansão no campo da informática é a análise de dados
+e  \href{https://www.mathworks.com/discovery/machine-learning.html}{machine learning}. Esta questão aborda um \emph{mónade} que ajuda
+a fazer, de forma simples, as operações básicas dessas técnicas. Esse mónade
+é conhecido por \emph{bag}, \emph{saco} ou \emph{multi-conjunto}, permitindo
+que os elementos de um conjunto tenham multiplicidades associadas. Por exemplo,
+seja
+\begin{code}
+data Marble = Red | Pink | Green | Blue | White deriving (Read,Show,Eq,Ord)
+\end{code}
+um tipo dado.\footnote{``Marble" traduz para ``berlinde" em português.}
+A lista |[ Pink,Green,Red,Blue,Green,Red,Green,Pink,Blue,White ]| tem elementos
+repetidos. Assumindo que a ordem não é importante, essa lista corresponde ao saco
+\begin{quote}\small
+\begin{verbatim}
+{ Red |-> 2 , Pink |-> 2 , Green |-> 3 , Blue |-> 2 , White |-> 1 }
+\end{verbatim}
+\end{quote}
+que habita o tipo genérico dos ``bags":
+\begin{code}
+data Bag a = B [(a,Int)] deriving (Ord)
+\end{code}
+O mónade que vamos construir sobre este tipo de dados faz a gestão automática das multiciplidades.
+Por exemplo, seja dada a função que dá o peso de cada berlinde em gramas:
+\begin{code}
+marbleWeight :: Marble -> Int
+marbleWeight Red   = 3
+marbleWeight Pink  = 2
+marbleWeight Green = 3
+marbleWeight Blue  = 6
+marbleWeight White = 2
+\end{code}
+Então, se quisermos saber quantos \emph{berlindes} temos, de cada \emph{peso}, não teremos que fazer contas:
+basta calcular
+\begin{code}
+marbleWeights = fmap marbleWeight bagOfMarbles
+\end{code}
+onde |bagOfMarbles| é o saco de berlindes referido acima, obtendo-se:
+\begin{quote}\small
+    \verb!{ 2 |-> 3 , 3 |-> 5 , 6 |-> 2 }!.
+\end{quote}
+%
+Mais ainda, se quisermos saber o total de berlindes em |bagOfMarbles| basta
+calcular |fmap (!) bagOfMarbles| obtendo-se \verb!{ () |-> 10 }!; isto é,
+o saco tem |10| berlindes no total.
+
+
+Finalmente, se quisermos saber a probabilidade da cor de um berlinde que tiremos do saco, basta converter
+o referido saco numa distribuição correndo:
+\begin{code}
+marblesDist = dist bagOfMarbles
+\end{code}
+obtendo-se a distribuição (graças ao módulo \Probability):
+\begin{quote}\small
+\begin{verbatim}
+Green  30.0%
+  Red  20.0%
+ Pink  20.0%
+ Blue  20.0%
+White  10.0%
+\end{verbatim}
+\end{quote}
+cf.\ Figura \ref{fig:dist}.
+
+\begin{figure}
+\begin{center}
+\includegraphics[width=0.4\textwidth]{cp1718t_media/marblesDist-mod5.png}
+\end{center}
+\caption{Distribuição de berlindes num saco.}
+\label{fig:dist}
+\end{figure}
+
+Partindo da seguinte declaração de |Bag| como um functor e como um mónade,
+\begin{code}
+instance Functor Bag where
+    fmap f = B. map (f><id) . unB
+
+instance Monad Bag where
+   x >>= f = (muB.fmap f) x where
+   return = singletonbag
+\end{code}
+\begin{enumerate}
+\item   
+Defina a função |muB| (multiplicação do mónade |Bag|) e a função auxiliar
+|singletonbag|.
+\item   Verifique-as com os seguintes testes unitários:
+%if False
+\begin{code}
+muB :: Bag (Bag a) -> Bag a
+\end{code}
+%endif
+\begin{teste}
+Lei |muB.return=id|:
+\begin{code}
+test5a = bagOfMarbles == muB (return bagOfMarbles)
+\end{code}
+\end{teste}
+\begin{teste}
+Lei |muB.muB = muB . fmap muB|:
+\begin{code}
+test5b = (muB . muB) b3 == (muB .fmap muB) b3
+\end{code}
+\vskip 1em
+onde |b3| é um saco dado em anexo.
+\end{teste}
+\end{enumerate}
+
+%----------------- Bibliografia (exige bibtex) --------------------------------%
+
+\bibliographystyle{plain}
+\bibliography{cp1718t}
+
+%----------------- Programa, bibliotecas e código auxiliar --------------------%
+
+\newpage
+
+\part*{Anexos}
+
+\appendix
+
+\section{Mónade para probabilidades e estatística}\label{sec:Dist}
+%format B = "\mathit B"
+%format C = "\mathit C"
+Mónades são functores com propriedades adicionais que nos permitem obter
+efeitos especiais em progra\-mação. Por exemplo, a biblioteca \Probability\
+oferece um mónade para abordar problemas de probabilidades. Nesta biblioteca,
+o conceito de distribuição estatística é captado pelo tipo
+\begin{eqnarray}
+    |newtype Dist a = D {unD :: [(a, ProbRep)]}|
+    \label{eq:Dist}
+\end{eqnarray}
+em que |ProbRep| é um real de |0| a |1|, equivalente a uma escala de |0| a |100%|.
+
+Cada par |(a,p)| numa distribuição |d::Dist a| indica que a probabilidade
+de |a| é |p|, devendo ser garantida a propriedade de  que todas as probabilidades
+de |d| somam |100%|.
+Por exemplo, a seguinte distribuição de classificações por escalões de $A$ a $E$,
+\[
+\begin{array}{ll}
+A & \rule{2mm}{3pt}\ 2\%\\
+B & \rule{12mm}{3pt}\ 12\%\\
+C & \rule{29mm}{3pt}\ 29\%\\
+D & \rule{35mm}{3pt}\ 35\%\\
+E & \rule{22mm}{3pt}\ 22\%\\
+\end{array}
+\]
+será representada pela distribuição
+\begin{code}
+d1 :: Dist Char
+d1 = D [('A',0.02),('B',0.12),('C',0.29),('D',0.35),('E',0.22)]
+\end{code}
+que o \GHCi\ mostrará assim:
+\begin{Verbatim}[fontsize=\small]
+'D'  35.0%
+'C'  29.0%
+'E'  22.0%
+'B'  12.0%
+'A'   2.0%
+\end{Verbatim}
+
+Este mónade é adequado à resolução de problemas de \emph{probabilidades e
+estatística} usando programação funcional, de forma elegante e como caso
+particular de programação monádica.
+
+\section{Definições auxiliares}\label{sec:helper_functions}
+Funções para mostrar \emph{bags}:
+\begin{code}
+instance (Show a, Ord a, Eq a) => Show (Bag a) where
+    show = showbag . consol . unB  where
+       showbag = concat .
+                 (++ [" }"]) .  ("{ ":) . 
+                 (intersperse " , ") .
+                 sort . 
+                 (map f) where f(a,b) = (show a) ++ " |-> " ++ (show b)
+unB (B x) = x
+\end{code}
+Igualdade de \emph{bags}:
+\begin{code}
+instance (Eq a) => Eq (Bag a) where
+   b == b' = (unB b) `lequal` (unB b')
+           where lequal a b = isempty (a `ominus` b)
+                 ominus a b = a ++ neg b
+                 neg x = [(k,-i) | (k,i) <- x]
+\end{code}
+Ainda sobre o mónade |Bag|:
+\begin{code}
+instance Applicative Bag where
+    pure = return
+    (<*>) = aap
+\end{code}
+O exemplo do texto:
+\begin{code}
+bagOfMarbles = B [(Pink,2),(Green,3),(Red,2),(Blue,2),(White,1)]
+\end{code}
+Um valor para teste (bags de bags de bags):
+\begin{code}
+b3 :: Bag (Bag (Bag Marble))
+b3= B [(B [(B[(Pink,2),(Green,3),(Red,2),(Blue,2),(White,1)],5)
+      ,(B [(Pink,1),(Green,2),(Red,1),(Blue,1)],4)],2)]
+\end{code}
+Outras funções auxiliares:
+\begin{code}
+a |-> b = (a,b)
+
+consol :: (Eq b) => [(b, Int)] -> [(b, Int)]
+consol = filter nzero . map (id >< sum) . col where nzero(_,x)=x/=0
+
+isempty :: Eq a => [(a, Int)] -> Bool
+isempty = all (==0) . map snd . consol
+
+col x = nub [ k |-> [ d' | (k',d') <- x , k'==k ] | (k,d) <- x ]
+
+consolidate :: Eq a => Bag a -> Bag a
+consolidate = B . consol . unB
+
+\end{code}
+
+%----------------- Soluções dos alunos -----------------------------------------%
+
+\section{Soluções dos alunos}\label{sec:resolucao}
+Os alunos devem colocar neste anexo as suas soluções aos exercícios
+propostos, de acordo com o ``layout'' que se fornece. Não podem ser
+alterados os nomes ou tipos das funções dadas, mas pode ser adicionado texto e / ou 
+outras funções auxiliares que sejam necessárias.
+
+\subsection*{Problema 1}
+
+\begin{center}
+\large \textbf{In e Out de Blockchain}
+\end{center}
+
+\begin{code}
+inBlockchain = either Bc Bcs
+
+outBlockchain (Bc a) = i1 a
+outBlockchain (Bcs b) = i2 b
+\end{code}
+
+\begin{center}
+\large \textbf{Anamorfismo, Catamorfismo e Hilomorfismo de uma Blockchain}
+\end{center}
+
+\begin{code}
+recBlockchain f = id -|- id >< f
+
+--Catamorfismo
+cataBlockchain g = g . recBlockchain(cataBlockchain g) . outBlockchain
+
+--Anamorfismo
+anaBlockchain g = inBlockchain . recBlockchain (anaBlockchain g) . g
+
+hyloBlockchain h g = cataBlockchain h . anaBlockchain g
+\end{code}
+
+\begin{center}
+\large \textbf{Resoluções}
+\end{center}
+
+\begin{center}
+\large {Resolução da função \emph{allTransactions}}
+\end{center}
+
+\par Representando a função através do seguinte catamorfismo:
+\begin{eqnarray*}
+\xymatrix@@C=3cm{
+    |Blockchain| 
+    \ar[d]_-{|cata allTransactions|}
+    \ar@@/^1pc/[r]^{|outBlockchain|}
+    \ar@@{}[r]||-{\cong}
+&
+    |Block + Block >< Blockchain| 
+    \ar[d]^{|id + id >< (cata allTransactions)|}
+    \ar@@/^1pc/[l]^{|inBlockchain|}
+\\
+     |Transactions| 
+& |Block + Block >< Transactions| 
+    \ar[l]^-{|either f (h . (f >< id))|}
+}
+\end{eqnarray*}
+\par Pode-se concluir que apenas é necessária uma função |f| que retire de cada |Block| a |Transactions|
+e uma |h| que junte a |Transactions| já retirada às |Transactions| da |Blockchain| já processada.
+Tendo em conta a construção de |Block = (MagicNr,(Time,(Transactions)))}|,
+a primeira função será a composição:  
+
+\begin{spec}
+f = p2 . p2
+\end{spec}
+
+e a segunda:
+
+\begin{spec}
+h = conc
+relembrando que: conc :: (a,[a]) -> [a]
+\end{spec}
+
+Desta forma a função |allTransactions| será definida da seguinte maneira:
+
+\begin{code}
+allTransactions = cataBlockchain(either f (conc . (f >< id))) where f = p2 . p2
+\end{code}
+
+\begin{center}
+\large {Resolução da função \emph{ledger}}
+\end{center}
+\par Tendo em vista o objectivo da função, que como o nome indica, é o de calcular o ledger de cada entidade, 
+podemos usar o catamorfismo definido na função \emph{allTransactions}. 
+\par Relembrando a definição da |Transactions|
+
+\begin{spec}
+Transactions = [(Entity,(Value,Entity))]
+\end{spec}
+
+podemos deduzir que a solução poderá passar por fazer a fissão de cada elemento desta lista, ou seja, 
+cada |Transaction :: (Entity(Value,Entity))| passa a ser do tipo |[(Entity,Value),(Entity,Value)]|,
+que por si já possui o mesmo tipo do conjunto de chegada da função |ledger| (|Ledger = [(Entity,Value)]|).
+\par Desenhando o diagrama do isomorfismo do tipo |Transactions|
+
+\begin{eqnarray*}
+\xymatrix@@C=1cm{
+    |Transactions| 
+    \ar@@/^1pc/[r]^{|out|}
+    \ar@@{}[r]||-{\cong}
+&
+    |1 + Transation >< Transactions| 
+    \ar@@/^1pc/[l]^{|in|}
+}
+\end{eqnarray*}
+
+\par Podemos inferir que a separação dos elementos é um catamorfismo que se denominou por |transSeparator|
+que pode ser representado da seguinte forma
+
+\begin{eqnarray*}
+\xymatrix@@C=3cm{
+    |Transaction| 
+    \ar[d]_-{|cata transSeparator|}
+    \ar@@/^1pc/[r]^{|out|}
+    \ar@@{}[r]||-{\cong}
+&
+    |1 + Transaction >< Transactions| 
+    \ar[d]^{|id + id >< (cata transSeparator)|}
+    \ar@@/^1pc/[l]^{|in|}
+\\
+     |Ledger| 
+& |1 + Transaction >< Ledger| 
+    \ar[l]^-{|g|}
+} 
+\end{eqnarray*}
+
+\par Todavia, falta definir o \emph{g} (generator). Que terá de ser do tipo 
+
+\begin{spec}
+g = [f, k]
+\end{spec}
+
+em que 
+
+\begin{spec}
+f = nil e k = conc . (transDivide >< id)
+\end{spec}
+
+na qual |transDivide| será a função que faz a fissão de uma |Transaction|.
+Função essa que pode ser definida da seguinte forma:
+
+\begin{code}
+transDivide (a,(b,c)) = [(a,-b),(c, b)]
+\end{code}
+
+\par Por consequência, a função |transSeparator| pode ser definida da seguinte maneira:
+
+\begin{code}
+transSeparator = cataList(either nil (conc . (transDivide >< id)))
+\end{code}
+
+\par Depois de aplicada esta função apenas falta somar o valor transacionado inerente a cada entidade, 
+de forma a obter o seu balanço total numa determinada |Blockchain|.
+\par Tal acção pode ser levada a cabo, aplicando o mecanismo:
+
+\begin{code}
+consolLedger = map (id >< sum) . col
+\end{code}
+
+\par Que nos faz chegar à solução final.
+\par Desta forma a função |ledger| poderá ser assim definida:
+
+\begin{code}
+ledger = consolLedger . transSeparator . allTransactions
+\end{code}
+
+\begin{center}
+\large {Resolução da função \emph{isValidMagicNr}}
+\end{center}
+
+\par O principal objetivo desta função é verificar se todos os números da Blockchain são válidos 
+ou seja, se nenhum número mágico \emph{MagicNo} aparece mais que uma vez. Para tal foi usado 
+um anamorfismo que é iniciado com uma lista vazia, onde à medida em que passa pela Blockchain verifica-se 
+se o \emph{MagicNo} está nesta lista em caso afirmativo, o Block é substituido por:  
+
+\begin{spec} 
+    Block = ("True",(0,[]))  
+\end{spec}
+
+\par Onde, neste caso o \emph{MagicNo} é substituido por True sendo este adicionado à lista, o número mágico é portanto válido. Em caso 
+negativo o \emph{MagicNo} já se encontra na lista, o Block é portanto substituido por: 
+
+\begin{spec} 
+    Block = ("False",(0,[])) 
+\end{spec}   
+
+\par Desta forma obtemos uma BlockChain que está populado com True e False, no passo seguinte é verificado 
+se ao longo do BlockChain todos os \emph{MagiNo} são True.  
+
+\par O raciocínio do grupo encontra-se expresso nos seguintes diagramas, anamorfismo e catamorfismo respetivamente:  
+\begin{eqnarray*}
+\xymatrix@@C=2cm{
+    |Blockchain|
+            \ar[d]_-{|ana magic2BoolGen|}
+            \ar[r]_-{|magic2BoolGen|}
+&
+    |Block + Block >< Blockchain|
+           \ar[d]^{|id + id >< ana magi2BoolGen|}
+\\
+     |Blockchain|
+&
+     |Block + Block >< Blockchain|
+           \ar[l]^-{|inBlockchain|}
+}
+\end{eqnarray*}
+
+\begin{eqnarray*}
+\xymatrix@@C=2cm{
+    |Blockchain|
+           \ar[d]_-{|cata validCheckGen|} 
+           \ar[r]_-{|outBlockchain|}
+&
+    |Block + Block >< Blockchain|
+           \ar[d]^{|id + id >< (cataNat validCheckGen)|}
+\\
+     |Bool|
+&
+     |Block + Block >< Bool|
+           \ar[l]^-{|validCheckGen|}
+}
+\end{eqnarray*}
+
+\par No fim foram traduzidos num hilomorfismo cujos genes são os seguintes:
+\begin{code}
+
+magic2BoolGen :: ([MagicNo], Blockchain) -> Either Block (Block, ([MagicNo], Blockchain))
+magic2BoolGen (l,Bc a)  = if (elem (p1 a) l) then i1 ("False",(0,[])) else i1 ("True",(0,[]))
+magic2BoolGen (l,Bcs b) = if (elem p l) then i2 i2fals else i2 i2verd
+                            where p      = (p1 . p1) b
+                                  pross  = [p] ++ l
+                                  verd   = ("True",(0,[]))
+                                  fals   = ("False",(0,[]))
+                                  i2verd = (verd,(pross, p2 b))
+                                  i2fals = (fals,( l , p2 b))
+
+validCheckGen = either bc bcs where
+                bc a  = (p1 a == "True")
+                bcs b = ((p1 . p1) b == "True" && p2 b)
+
+isValidMagicNr = curry (hyloBlockchain validCheckGen magic2BoolGen) [] 
+\end{code}
+
+
+\subsection*{Problema 2}
+
+\begin{center}
+\large \textbf{In e Out de QuadTree}
+\end{center}
+
+\begin{code}
+
+inQTree = either cell block where cell (a,(b,c)) = Cell a b c
+                                  block (a,(b,(c,d))) = Block a b c d
+
+outQTree (Cell a b c) = i1 (a,(b,c))
+outQTree (Block d e f g) = i2 (d,(e,(f,g)))
+\end{code}
+
+\begin{center}
+\large \textbf{Anamorfismo, Catamorfismo, Hilomorfismo, functor base e map de uma QuadTree}
+\end{center}
+
+\begin{code}
+baseQTree f g = f >< id -|- g >< (g >< (g >< g))
+
+recQTree f = id -|- f >< (f >< (f >< f))
+
+--Catamorfismo
+cataQTree g = g . recQTree(cataQTree g) . outQTree
+
+--Anamorfismo
+anaQTree g = inQTree . recQTree(anaQTree g) . g
+
+hyloQTree h g = cataQTree h . anaQTree g
+
+instance Functor QTree where
+    fmap f = cataQTree (inQTree . (baseQTree f id))
+\end{code}
+
+\begin{center}
+\large \textbf{Resoluções}
+\end{center}
+
+\begin{center}
+\large {Resolução da função \emph{rotateQTree}}
+\end{center}
+
+\par Pretende-se com esta função aplicar uma rotação
+a uma |QTree|, de modo que, aplicando tal função numa imagem
+traduzida por uma |QTree| esta rode no sentido dos ponteiros do relógio da seguinte maneira:
+
+\begin{figure}[H]
+\begin{center}
+    \includegraphics[width=6cm]{troca}
+\end{center}
+\end{figure}
+
+\par Para efeito basta usar um Catamorfismo que aplica a troca.
+Pode-se assim deduzir que a função |rotateQTree| é um Catamorfismo, cujo seu \emph{generator} 
+e a própria função podem ser definidos da seguinte forma:
+
+\begin{code}
+qSwapperGen :: Either (a, (Int, Int)) (QTree a, (QTree a, (QTree a, QTree a))) -> QTree a
+qSwapperGen = either cell rigthrotation where cell (a,(b,c)) = Cell a c b -- as dimensões trocam 
+                                              rigthrotation (a,(b,(c,d))) = Block c a d b -- rotação no sentido dos ponteiros
+
+rotateQTree = cataQTree qSwapperGen
+\end{code}
+
+\begin{figure}[H]
+\begin{center} 
+    \includegraphics[width=3cm]{person90}   
+    \caption{Resultado do grupo do rotateBMP}
+\end{center}
+\end{figure}
+
+
+\begin{center}
+\large {Resolução da função \emph{scaleQTree}}
+\end{center}
+
+\par O objectivo desta função é alterar o tamanho de uma |Cell|
+segundo um factor dado. Para tal, definiu-se o Anaformismo:
+
+\begin{eqnarray*}
+\xymatrix@@C=2cm{
+     |QTree| 
+    \ar[r]^-{|scaleGen|}  
+    \ar[d]^-{|ana scaleQTree|}
+& 
+     |Cell + QTree >< ((Int,QTree) >< ((Int,QTree) , (Int,QTree)))| 
+    \ar[d]^-{|id + ana scaleQTree >< (ana scaleQTree >< (ana scaleQTree >< ana scaleQTree))|}
+\\
+     |QTree| 
+    \ar@@/^1pc/[r]^{|outQTree|}
+    \ar@@{}[r]||-{\cong}
+&
+    |Cell +  QTree >< (QTree >< (QTree >< QTree))| 
+    \ar@@/^1pc/[l]^{|inQTree|}
+} 
+\end{eqnarray*}
+
+\par Em que |scaleGen| e |scaleQTree| são definidos do seguinte modo:
+
+\begin{code}
+type PairQTInt t = (Int, QTree t)
+
+scaleGen :: PairQTInt t -> Either (t, (Int, Int)) (PairQTInt t, (PairQTInt t, (PairQTInt t, PairQTInt t)))
+scaleGen (x,Cell a b c) = i1 (a,(b*x,c*x))
+scaleGen (x,Block a b c d) = i2 ((x,a),((x,b),((x,c),(x,d))))
+
+scaleQTree = curry (anaQTree scaleGen)
+\end{code}
+
+\begin{figure}[H]
+\begin{center} 
+    \includegraphics[width=3cm]{personx2} 
+    \caption{Resultado do grupo do scaleBMP}
+\end{center}
+\end{figure}
+
+
+\begin{center}
+\large {Resolução da função \emph{invertQTree}}
+\end{center}
+
+\par A função |invertQTree| tem como propósito a inversão de cores de uma |QTree PixelRGBA8|.
+
+\begin{spec} 
+Relembrando o construtor
+PixelRGBA8 :: Pixel8 -> Pixel8 -> Pixel8 -> Pixel8 -> PixelRGBA8
+em que 
+Pixel8 = red green blue alpha ,respectivamente.
+\end{spec}
+
+\par Visto que, para inverter um pixel basta subtrair 255-c para cada componente c de cor RGB, 
+excepto para alpha. Desta forma, é possível deduzir o Catamorfismo que faz a inversão.
+Catamorfismo esse representado no diagrama abaixo.
+
+\begin{eqnarray*}
+\xymatrix@@C=1.4cm{
+    |QTree PixelRGBA8| 
+    \ar[d]^-{|cata invertQTree|}
+    \ar@@/^1pc/[r]^{|outQTree|}
+    \ar@@{}[r]||-{\cong}
+&
+    |Cell +  QTree >< (QTree >< (QTree >< QTree))| 
+    \ar[d]^{|id + cata invertQTree >< (cata invertQTree >< (cata invertQTree >< cata invertQTree))|}
+    \ar@@/^1pc/[l]^{|inQTree|}
+\\
+     |QTree PixelRGBA8| 
+& |Cell +  QTree >< (QTree >< (QTree >< QTree))| 
+    \ar[l]^-{|invertGen|}
+} 
+\end{eqnarray*}
+
+Cuja definição das funções é dada da seguinte maneira, 
+
+\begin{code}
+type QTPixel = QTree PixelRGBA8
+
+invertGen :: Either (PixelRGBA8, (Int, Int)) (QTPixel, (QTPixel, (QTPixel, QTPixel))) -> QTPixel
+invertGen = inQTree . (baseQTree pixelInvert id)
+
+pixelInvert (PixelRGBA8 red green blue alpha) = PixelRGBA8 (255-red) (255-green) (255-blue) alpha
+
+invertQTree = cataQTree(invertGen)
+\end{code}
+
+\begin{figure}[H]
+\begin{center} 
+    \includegraphics[width=2cm]{personinv} 
+    \caption{Resultado do grupo do invertBMP}
+\end{center}
+\end{figure}
+
+
+\begin{center}
+\large {Resolução da função \emph{compressQTree}}
+\end{center}
+
+\par O objetivo desta função é comprimir uma QTree dado um nível de compressão x, para tal foi elaborado um 
+conjunto de funções. Em primeiro lugar medimos a profundidade total da árvore original sendo depois subtraido 
+o nível de compressão à profundidade, é feita de seguida uma contagem decrescente até chegar à profundidade 
+resultante da subtração. Ao chegar a esta profundidade se for uma \emph{Cell} não se aplica alterações caso 
+contrário é um \emph{Block} onde este é transformado numa \emph{Cell}. 
+
+\begin{code}
+
+compressGen :: (Int, QTree a) -> Either (a, (Int, Int)) ((Int, QTree a), ((Int, QTree a), ((Int, QTree a), (Int, QTree a))))
+compressGen (countDown, Cell a b c) = i1 (a,(b,c))
+compressGen (countDown, Block a b c d) = if(countDown == 0) then i1 (wandh (Block a b c d)) else i2 counts
+                           where count = countDown-1
+                                 counts = ((count,a),((count,b),((count,c),(count,d))))
+\end{code} 
+
+\par Originalmente estava planeado fazer esta função com o recurso a três catas, sendo depois transformados 
+num só, de modo a facilitar o entendimento desta função esta foi separada em quatro passos diferentes, *1, 
+*2, *3 e *4 como pode ser visto em comentário da função.   
+
+\begin{code}
+wandh :: QTree a -> (a, (Int,Int))
+wandh = lastStep . cataQTree
+        (split (either (singl . (id >< (fromIntegral . mul . split (toInteger . p1) (toInteger . p2)))) -- *1 
+                       (conc . split (conc . split (p1. p1) (p1 . p1 . p2)) (conc . split (p1 . p1 . p2 . p2) (p1 . p2 . p2 .p2)))) -- *2
+               (split (either (toInteger . p1 . p2) (add . (split (p1 . p2 . p1) (p1 . p2 . p1 . p2)))) -- *3
+                      (either (toInteger . p2 . p2) (add . (split (p2 . p2 . p1) (p2 . p2 .  p1 . p2 . p2)))))) -- *4
+\end{code}
+
+\begin{figure}[H]
+\begin{center}
+    \includegraphics[width=6cm]{wandh} 
+    \caption{Figura representativa do funcionamento do wandh}
+\end{center}
+\end{figure}
+
+\par O *1 constroi uma lista de pares em que o primeiro elemento é o tipo da árvore (a) e o segundo é a área do bloco, 
+o intuito do *2 é construir uma só lista com os pares todos concatenados da seguinte maneira: 
+
+\begin{figure}[H]
+\begin{center}
+    \includegraphics[width=5cm]{conc} 
+    \caption{Figura representativa do funcionamento do *2}
+\end{center}
+\end{figure}
+
+\par O *3 calcula o comprimento do bloco e por fim o *4 calcula a altura do bloco, de seguida na lista resultante 
+é retirado o par que ocupa maior área ignorando todos os outros pares.  
+
+\begin{code}
+minPair :: [(a, Int)] -> (a,Int)
+minPair [a] = a
+minPair (h:t) = let x = minPair t in (miniPair h x)
+
+miniPair :: (t, Int) -> (t, Int) -> (t, Int)
+miniPair (a,b) (c,d) = if (b>d) then (a,b) else (c,d)
+
+lastStep :: ([(a,Int)],(Integer , Integer)) -> (a,(Int,Int))
+lastStep =  (p1 . minPair) >< (fromIntegral >< fromIntegral) 
+\end{code}
+
+\par No fim é chegada a seguinte solução da compress: 
+
+\begin{code}
+compressQTree x qt = (anaQTree compressGen) (minusNat (depthQTree qt) x, qt)
+\end{code}
+
+\par Foram geradas segundo esta solução as seguintes imagens: 
+
+\begin{figure}[H]
+%
+\begin{subfigure}{0.5\textwidth}
+\centering
+\includegraphics[width=0.2\linewidth]{person0}
+\caption{Compressão nível 0}
+\end{subfigure}
+%
+\begin{subfigure}{0.5\textwidth}
+\centering
+\includegraphics[width=0.2\linewidth]{person1}
+\caption{Compressão nível 1}
+\end{subfigure}
+%
+\begin{subfigure}{0.5\textwidth}
+\centering
+\includegraphics[width=0.2\linewidth]{person2}
+\caption{Compressão nível 2}
+\end{subfigure}
+%
+\begin{subfigure}{0.5\textwidth}
+\centering
+\includegraphics[width=0.2\linewidth]{person3}
+\caption{Compressão nível 3}
+\end{subfigure}
+%
+\begin{subfigure}{0.5\textwidth}
+\centering
+\includegraphics[width=0.2\linewidth]{person4}
+\caption{Compresão de nível 4}
+\end{subfigure}
+\end{figure}
+
+
+\begin{center}
+\large {Resolução da função \emph{outlineQTree}}
+\end{center}
+
+\par Função cujo intuito é converter uma quad tree numa matriz monocromática de modo 
+a desenhar o contorno de uma malha poligonal para tal foi alterada uma função disponibilizada 
+pelos docentes de modo a: 
+
+\begin{figure}[H]
+\begin{center}
+    \includegraphics[width=6cm]{matrix} 
+    \caption{Figura representativa do funcionamento da função qtB2bmB}
+\end{center}
+\end{figure}
+
+\begin{code}
+qtB2bmB :: QTree Bool -> Matrix Bool
+qtB2bmB = cataQTree (either f g) where
+    f (k,(i,j)) = if (k && (i >= 3) && (j >= 3)) then matriz i j else matrix j i (const k)
+    g (a,(b,(c,d))) = (a <|> b) <-> (c <|> d)
+    matriz i j = (matrix 1 i true) <->        -- linha de cima
+                 (((matrix (j-2) 1 true) <|>  -- coluna esquerda
+                 ((matrix (j-2) (i-2) false)  -- matriz central
+                 <|> (matrix (j-2) 1 true)))  -- coluna direita
+                 <-> (matrix 1 i true))       -- linha de baixo
+
+outlineQTree f = qtB2bmB . cataQTree(inQTree . (baseQTree f id))
+\end{code}
+
+\par Os resultados obtidos pelo grupo foram os seguintes: 
+
+\begin{figure}[H]
+%
+\begin{subfigure}{0.5\textwidth}
+\centering
+\includegraphics[width=0.2\linewidth]{personOut1}
+\caption{Resultado da outlineBMP}
+\end{subfigure}
+%
+\begin{subfigure}{0.5\textwidth}
+\centering
+\includegraphics[width=0.2\linewidth]{personOut2}
+\caption{Resultado da addOutlineBMP}
+\end{subfigure}
+\end{figure}
+
+
+\subsection*{Problema 3}
+
+\begin{center}
+\large \textbf{Resoluções}
+\end{center}
+
+\par De modo a resolver este problema, o grupo recorreu as leis do cálculo funcional de modo a derivar 
+as funções de \emph{base k} e \emph{loop}, começou-se por aplicar a lei de recursividade múltipla a 
+|split (f k)(l k)| do seguinte modo:  
+
+\begin{eqnarray*} 
+\start  
+    |lcbr( 
+        |lcbr( 
+            f k (const 0) = const 1
+        )( 
+            f k succ = mul . |split (f k)(l k)|
+        )
+        |
+    )( 
+        |lcbr( 
+            l k (const 0) = const (k+1) 
+        )( 
+            l k succ = (+1) . l k
+        )
+        |
+    )|
+% 
+\just\equiv{ Eq + ; def de inNat} 
+% 
+    |lcbr( 
+            (f k) . inNat = either(const 1) (mul . split(f k)(l k)) 
+         )(  
+            (l k) . inNat = either(const (k+1)) ((+1) . (l k))           
+    )|
+% 
+\just\equiv{Fokkinga ; Absorção +} 
+% 
+
+    |lcbr( 
+            (f k) . inNat = (either(const 1) (mul)) . (id -|- split(f k)(l k))   
+        )(  
+            (l k) . inNat = either(const (k+1)) ((+1) . p2) . (id -|- split(f k)(l k))
+    ) 
+    |
+% 
+\just\equiv{ Fokkinga } 
+%
+    |cata(split  (   either  (  const 1) mul ) (  either (  const (  k+1  )  ) (  (+1) . p2   ) ) )  |
+
+\qed
+\end{eqnarray*}
+
+\begin{code}
+f k 0 = 1
+f k n =  (l k d) * (f k d) where d = n-1 
+
+fl k = cataNat(split (either one mul)  (either (const(k+1)) ((+1) . p2)))
+
+l k 0 = k+1
+l k n = (l k d) + 1 where d = n-1
+
+g 0 = 1
+g n = (s d) * (g d) where d = n-1  
+
+gs = cataNat(split (either one mul) (either one ((+1) . p2)))
+
+s 0 = 1
+s n = (s d) + 1 where d = n-1
+
+succAfterP1 = succ . p2 . p1
+succAfterP2 = succ . p2 . p2
+
+bas k = either (split (split one (const(k+1))) (split one one))  (split  (split  (mul . p1) succAfterP1) (split (mul . p2) succAfterP2))
+ 
+flatRandL ((a,b),(c,d)) = (a,b,c,d)
+
+unFlatReL (a,b,c,d) = ((a,b),(c,d)) 
+--------------base----------
+base k = (1,k+1,1,1)
+--------------loop-----------------
+loop = flatRandL . (split  (split  (mul . p1) ((+1) . p2 . p1)) (split (mul . p2) ((+1) . p2 . p2))) . unFlatReL
+\end{code}
+
+\subsection*{Problema 4}
+
+\begin{center}
+\large \textbf{In e Out de FTree}
+\end{center}
+
+\begin{code}
+inFTree = either Unit comp where comp (a,(b,c)) = Comp a b c
+                                 
+outFTree (Unit a) = i1 a
+outFTree (Comp a b c) = i2 (a,(b,c))
+\end{code}
+
+\begin{center}
+\large \textbf{Anamorfismo, Catamorfismo, Hilomorfismo, functor base e map de uma FTree}
+\end{center}
+
+\begin{code}
+baseFTree f g h = g -|- f >< (h >< h)
+
+recFTree f = id -|- id >< (f >< f)
+
+cataFTree g = g . recFTree(cataFTree g) . outFTree
+
+anaFTree g = inFTree . recFTree(anaFTree g) . g
+
+hyloFTree g h = cataFTree g . anaFTree h
+
+instance Bifunctor FTree where
+    bimap f g = cataFTree (inFTree . (baseFTree f g id))  
+\end{code}
+
+\begin{center}
+\large \textbf{Resoluções}
+\end{center}
+
+\begin{center}
+\large {Resolução da função \emph{generatePTree}}
+\end{center}
+
+\begin{code}
+fTreeGen :: (Int,Int) -> Either Float (Float, ((Int,Int),(Int,Int)))
+fTreeGen (x,y) = if(x==y) then i1 tam else i2 (tam, ((x,y+1),(x,y+1))) where tam = size*(((sqrt 2)/2)^y)
+                                                                             size = 100 --tamanho do lado do primeiro quadrado
+
+generatePTree x = if (x<0) then  error "Uma árvore de Pitágoras não possui ordem negativa"
+                           else (anaFTree fTreeGen) (x,0)
+\end{code}
+
+\begin{center}
+\large {Resolução da função \emph{drawPTree}}
+\end{center}
+
+\begin{code}
+draw :: FTree a b -> [FTree Picture Picture]
+draw x = if(depth>1) then [Unit (square size)] ++ (map (anaFTree(pictureGen)) [(sq, (0, (3, generatePTree y))) | y<-[1..(depth-1)]]) ++ [ anaFTree(pictureGen) ((square size),(0, (3 ,x)))] 
+                     else if(depth==1) then [Unit (square size), anaFTree(pictureGen) ((square size), (0, (3 ,generatePTree 1)))] else [Unit (square size)]
+                                                       where depth = depthFTree x
+                                                             size = 100
+                                                             sq = square size
+
+pictureGen :: (Picture,( Int, (Int, FTree a b))) -> Either Picture (Picture, ((Picture,(Int,(Int, FTree a b))),(Picture,(Int,(Int,FTree a b)))))
+pictureGen (pic, (ordemat,(dir,Unit a))) = if(dir==1) then i1 (esquerda pic) else i1 (direita pic)
+pictureGen (pic, (ordemat,(dir,Comp a b c))) = if (dir==3) then  i2 (pic,((pic, (ordemat+1, (1, b))),(pic,(ordemat+1,(2,c)))))
+                                               else
+                                                  if(dir==1) then i2 ((esquerda pic),(((esquerda pic), (ordemat+1, (1,b))),((esquerda pic),(ordemat+1,(2,c))))) 
+                                                                     else i2 ((direita pic),(((direita pic), (ordemat+1, (1,b))),((direita pic),(ordemat+1,(2,c))))) 
+                                                                         
+esquerda :: Picture -> Picture
+esquerda = rotationLft . Main.resize . translationLft
+
+translationLft :: Picture -> Picture
+translationLft (Polygon [(a,b),(c,d),(e,f),(g,h)]) = 
+                         (Polygon [(a + (c-(a)) + ((c-e)/2), b + (d-(b)) + ((d-f)/2)),
+                            (c + (c-(a)) + ((c-e)/2), d + (d-(b)) + ((d-f)/2)),
+                            (e + (c-(a)) + ((c-e)/2), f + (d-(b)) + ((d-f)/2)),
+                            (g + (c-(a)) + ((c-e)/2), h + (d-(b)) + ((d-f)/2))])
+                                                                                           
+direita :: Picture -> Picture
+direita = rotationRgt . Main.resize . translationRgt
+
+translationRgt :: Picture -> Picture
+translationRgt (Polygon [(a,b),(c,d),(e,f),(g,h)]) = 
+                    (Polygon [(a + (c-(a)) + ((e-c)/2), b + (d-(b)) + ((f-d)/2)),
+                              (c + (c-(a)) + ((e-c)/2), d + (d-(b)) + ((f-d)/2)),
+                              (e + (c-(a)) + ((e-c)/2), f + (d-(b)) + ((f-d)/2)),
+                              (g + (c-(a)) + ((e-c)/2), h + (d-(b)) + ((f-d)/2))])
+
+resize :: Picture -> Picture
+resize (Polygon [(a,b),(c,d),(e,f),(g,h)]) = 
+            (Polygon [(a + ((e-a)/2)*mini, b + ((f-b)/2)*mini),   
+                      (c + ((g-c)/2)*mini, d + ((h-d)/2)*mini),  
+                      (e - ((e-a)/2)*mini, f - ((f-b)/2)*mini),     
+                      (g - ((g-c)/2)*mini, h - ((h-d)/2)*mini)])
+                           where mini = 0.20
+
+rotationRgt :: Picture -> Picture
+rotationRgt (Polygon [(a,b),(c,d),(e,f),(g,h)]) = 
+                 (Polygon [((a+(e-a)/2) - (((g-a)/2)+ ((g-a)/2)*mini),(b+(f-b)/2) - (((h-b)/2) + ((h-b)/2)*mini)),
+                           ((a+(e-a)/2) + (((c-a)/2) + ((c-a)/2)*mini),(b+(f-b)/2) + (((d-b)/2)+ ((d-b)/2)*mini)),
+                           ((a+(e-a)/2) + (((g-a)/2)+ ((g-a)/2)*mini ),(b+(f-b)/2) + (((h-b)/2)) + ((h-b)/2)*mini),
+                           ((a+(e-a)/2) - (((c-a)/2) + ((c-a)/2)*mini),(b+(f-b)/2) - (((d-b)/2)+ ((d-b)/2)*mini))])
+                                where mini = 1 - (sqrt 2 / 2)
+
+rotationLft :: Picture -> Picture
+rotationLft (Polygon [(a,b),(c,d),(e,f),(g,h)]) = 
+                 (Polygon [((a+(e-a)/2) - (((c-a)/2) + ((c-a)/2)*mini),(b+(f-b)/2) - (((d-b)/2)+ ((d-b)/2)*mini)),
+                           ((a+(e-a)/2) - (((g-a)/2)+ ((g-a)/2)*mini ),(b+(f-b)/2) - (((h-b)/2) + ((h-b)/2)*mini)),
+                           ((a+(e-a)/2) + (((c-a)/2) + ((c-a)/2)*mini),(b+(f-b)/2) + (((d-b)/2)+ ((d-b)/2)*mini)),
+                           ((a+(e-a)/2) + (((g-a)/2)+ ((g-a)/2)*mini ),(b+(f-b)/2) + (((h-b)/2)) + ((h-b)/2)*mini)])
+                                where mini = 1 - (sqrt 2 / 2)
+
+extraiPic = cataFTree (either singl (cons . (id >< conc)))
+
+drawPTree = map (pictures . extraiPic) . draw 
+\end{code}
+
+\subsection*{Problema 5}
+
+\begin{code}
+
+--test5a    Verifica
+--test5b    Verifica
+
+------------singletonbag---------------
+singletonbag = B . singl . split id (fromIntegral . one) 
+------------muB-----------------------
+muB = (B . concat . map (unB . p1) . unB)
+----------dist----------------
+dist x = (D . map (id >< divi) . unB) x where
+         total = (fromIntegral . sum . cataList g . unB) x 
+         divi y = (fromIntegral y)/total
+         g = either nil (cons . (p2 >< id))
+
+\end{code}
+
+\section{Como exprimir cálculos e diagramas em LaTeX/lhs2tex}
+Estudar o texto fonte deste trabalho para obter o efeito:\footnote{Exemplos tirados de \cite{Ol18}.} 
+\begin{eqnarray*}
+\start
+    |id = split f g|
+%
+s\just\equiv{ universal property }
+%
+        |lcbr(
+        p1 . id = f
+    )(
+        p2 . id = g
+    )|
+%
+\just\equiv{ identity }
+%
+        |lcbr(
+        p1 = f
+    )(
+        p2 = g
+    )|
+\qed
+\end{eqnarray*}
+
+Os diagramas podem ser produzidos recorrendo à \emph{package} \LaTeX\ 
+\href{https://ctan.org/pkg/xymatrix}{xymatrix}, por exemplo: 
+\begin{eqnarray*}
+\xymatrix@@C=2cm{
+    |Nat0|
+           \ar[d]_-{|cataNat g|}
+&
+    |1 + Nat0|
+           \ar[d]^{|id + (cataNat g)|}
+           \ar[l]_-{|inNat|}
+\\
+     |B|
+&
+     |1 + B|
+           \ar[l]^-{|g|}
+}
+\end{eqnarray*}
+
+%----------------- Fim do anexo com soluções dos alunos ------------------------%
+
+%----------------- Índice remissivo (exige makeindex) -------------------------%
+
+\printindex
+
+%----------------- Outras definições auxiliares -------------------------------------------%
+
+%if False
+\begin{code}
+infixr 0 .==>.
+(.==>.) :: (Testable prop) => (a -> Bool) -> (a -> prop) -> a -> Property
+p .==>. f = \a -> p a ==> f a
+
+infixr 0 .<==>.
+(.<==>.) :: (a -> Bool) -> (a -> Bool) -> a -> Property
+p .<==>. f = \a -> (p a ==> property (f a)) .&&. (f a ==> property (p a))
+
+infixr 4 .==.
+(.==.) :: Eq b => (a -> b) -> (a -> b) -> (a -> Bool)
+f .==. g = \a -> f a == g a
+
+infixr 4 .<=.
+(.<=.) :: Ord b => (a -> b) -> (a -> b) -> (a -> Bool)
+f .<=. g = \a -> f a <= g a
+
+newtype Nat = Nat {getNat :: Int}
+ deriving ( Eq, Ord, Show, Enum, Read, Typeable)
+
+instance Arbitrary Nat where
+  arbitrary =
+    (frequency
+       [ (5, (Nat . abs) `fmap` arbitrary)
+       , (1, return (Nat 0))
+       ]
+    ) `suchThat` ge0
+    where ge0 (Nat x) = x >= 0
+
+  shrink (Nat x) =
+    [ Nat x'
+    | x' <- shrink x
+    , x' >= 0
+    ]
+
+newtype SmallNat = SmallNat Int
+ deriving ( Eq, Ord, Show, Read,Enum,Num,Typeable)
+
+instance Arbitrary SmallNat where
+  arbitrary = liftM SmallNat (QuickCheck.choose (0,10))
+
+  shrink (SmallNat x) =
+    [ SmallNat x'
+    | x' <- shrink x
+    , x' >= 0, x' <= 10
+    ]
+    
+instance Arbitrary a => Arbitrary (Matrix a) where
+  arbitrary = do
+    rows <- QuickCheck.choose (0,100)
+    cols <- QuickCheck.choose (0,100)
+    xs <- vectorOf (rows * cols) arbitrary
+    return (fromList rows cols xs)
+  shrink = shrinkNothing
+
+minusNat :: Int -> Int -> Int
+minusNat x = Nat.for predNat x
+
+predNat :: Int -> Int
+predNat 0 = 0
+predNat n = n - 1
+
+-- * pergunta 1
+
+data Blockchain = Bc {bc :: Block}  |  Bcs {bcs :: (Block, Blockchain)} deriving Show
+type Block = (MagicNo, (Time, Transactions))
+type Transaction = (Entity, (Value, Entity))
+type Transactions = [Transaction]
+type Ledger = [(Entity, Value)]
+type MagicNo = String
+type Time = Int  -- em milisegundos
+type Entity = String
+type Value = Int
+
+inBlockchain :: Either Block (Block, Blockchain) -> Blockchain
+outBlockchain :: Blockchain -> Either Block (Block, Blockchain)
+recBlockchain :: (c -> d) -> Either b1 (b2, c) -> Either b1 (b2, d)
+cataBlockchain :: (Either Block (Block, d) -> d) -> Blockchain -> d
+anaBlockchain :: (c -> Either Block (Block, c)) -> c -> Blockchain
+hyloBlockchain :: (Either Block (Block, c1) -> c1) -> (c2 -> Either Block (Block, c2)) -> c2 -> c1
+
+list2chain [] = Bc ("numeromagico1", (0, []))
+list2chain [b] = Bc b
+list2chain (h:t) = Bcs (h, list2chain t)
+
+instance Arbitrary Blockchain where
+  arbitrary = do
+    xs <- arbitrary
+    -- nao convem ter numeros repetidos
+    return $ list2chain $ nubBy (\(n, _) (n', _) -> n /= n') xs
+  shrink = shrinkNothing
+
+e1 = "ent1"
+e2 = "ent2"
+
+mg1 = "b1"
+mg2 = "b2"
+mg3 = "b3"
+
+tm1 = 1
+tm2 = 2
+tm3 = 3
+
+t1 = (e1, (100, e2))
+t2 = (e2, (50, e1))
+
+bl1, bl2, bl3 :: Block
+bl1 = (mg1, (tm1, []))
+bl2 = (mg2, (tm2, [t1]))
+bl3 = (mg3, (tm3, [t2]))
+
+bs1, bs2 :: Blockchain
+bs1 = Bcs (bl1, Bcs (bl2, Bc bl3))
+bs2 = Bcs (bl3, Bcs (bl2, Bc bl2))
+bs3 = Bc bl2
+bs4 = Bcs (bl1, Bc bl3)
+
+
+reverseChain :: Blockchain -> Blockchain
+reverseChain = cataBlockchain (either Bc snocChain)
+
+
+snocChain :: (Block, Blockchain) -> Blockchain
+snocChain (b, Bc b') = Bcs (b', Bc b)
+snocChain (b, Bcs (b', bs)) = Bcs (b', snocChain (b, bs))
+
+
+concChain :: (Blockchain, Blockchain) -> Blockchain
+concChain (b1, (Bc b)) = snocChain (b, b1)
+concChain (b1, (Bcs (b, bs))) = concChain ((snocChain (b, b1)), bs)
+
+
+lenChain = cataBlockchain (either (const 1) (succ . p2))
+
+-- * pergunta 2
+
+data QTree a = Cell a Int Int | Block (QTree a) (QTree a) (QTree a) (QTree a)
+  deriving (Eq,Show)
+  
+inQTree :: Either (a, (Int, Int)) (QTree a, (QTree a, (QTree a, QTree a))) -> QTree a
+outQTree :: QTree a -> Either (a, (Int, Int)) (QTree a, (QTree a, (QTree a, QTree a)))
+baseQTree :: (a1 -> b) -> (a2 -> d1) -> Either (a1, d2) (a2, (a2, (a2, a2))) -> Either (b, d2) (d1, (d1, (d1, d1)))
+recQTree :: (a -> d1) -> Either (b, d2) (a, (a, (a, a))) -> Either (b, d2) (d1, (d1, (d1, d1)))
+cataQTree :: (Either (b, (Int, Int)) (d, (d, (d, d))) -> d) -> QTree b -> d
+anaQTree :: (a1 -> Either (a2, (Int, Int)) (a1, (a1, (a1, a1)))) -> a1 -> QTree a2
+hyloQTree :: (Either (b, (Int, Int)) (c, (c, (c, c))) -> c) -> (a -> Either (b, (Int, Int)) (a, (a, (a, a)))) -> a -> c
+
+instance (Eq a,Arbitrary a) => Arbitrary (QTree a) where
+  arbitrary = do
+    rows <- QuickCheck.choose (1,100)
+    cols <- QuickCheck.choose (1,100)
+    xs <- vectorOf (rows * cols) arbitrary
+    return ((bm2qt . fromList rows cols) xs)
+  shrink = shrinkNothing
+
+rotateMatrix :: Matrix a -> Matrix a
+rotateMatrix m = matrix (ncols m) (nrows m) rot
+    where
+    rot (j,i) = unsafeGet (nrows m - i + 1) j m
+
+rotatebm :: Eq a => Matrix a -> Matrix a
+rotatebm = qt2bm . rotateQTree . bm2qt
+
+rotateBMP :: FilePath -> FilePath -> IO ()
+rotateBMP from to = withBMP from to rotatebm
+
+instance Arbitrary PixelRGBA8 where
+    arbitrary = do
+        r <- px
+        g <- px
+        b <- px
+        a <- px
+        return (PixelRGBA8 r g b a)
+      where px = QuickCheck.choose (0,255)
+    shrink = shrinkNothing
+
+sizeMatrix :: Matrix a -> (Int,Int)
+sizeMatrix = ncols `split` nrows
+    
+sizeQTree :: QTree a -> (Int,Int)
+sizeQTree = cataQTree (either snd g)
+    where
+    g (a,(b,(c,d))) = (fst a + fst b,snd a + snd c)
+
+shapeQTree :: QTree a -> QTree ()
+shapeQTree = fmap (!)
+
+scalebm :: Eq a => Int -> Matrix a -> Matrix a
+scalebm s = qt2bm . scaleQTree s . bm2qt
+
+scaleBMP :: Int -> FilePath -> FilePath -> IO ()
+scaleBMP s from to = withBMP from to (scalebm s)
+
+invertbm :: Matrix PixelRGBA8 -> Matrix PixelRGBA8
+invertbm = qt2bm . invertQTree . bm2qt
+
+invertBMP :: FilePath -> FilePath -> IO ()
+invertBMP from to = withBMP from to invertbm
+
+depthQTree :: QTree a -> Int
+depthQTree = cataQTree (either (const 0) f)
+    where f (a,(b,(c,d))) = 1 + maximum [a,b,c,d]
+
+compressbm :: Eq a => Int -> Matrix a -> Matrix a
+compressbm n = qt2bm . compressQTree n . bm2qt
+
+compressBMP :: Int -> FilePath -> FilePath -> IO ()
+compressBMP n from to = withBMP from to (compressbm n)
+
+outlinebm :: Eq a => (a -> Bool) -> Matrix a -> Matrix Bool
+outlinebm isBackground = outlineQTree isBackground . bm2qt
+
+outlineBMP :: FilePath -> FilePath -> IO ()
+outlineBMP from to = withBMP from to (fmap mono . outlinebm (==whitePx))
+    where
+    mono False = whitePx
+    mono True = blackPx
+    
+addOutlineBMP :: FilePath -> FilePath -> IO ()
+addOutlineBMP from to = withBMP from to joinbm
+    where
+    joinbm bm = elementwiseUnsafe joinpx bm (outlinebm (==whitePx) bm)
+    joinpx px1 False = px1
+    joinpx px1 True = blackPx
+
+qtOut = fromLists 
+    [[  True, True, True, True, True, True, True, True ]
+    ,[  True,False,False, True, True, True, True, True ]
+    ,[  True,False,False, True,False,False,False, True ]
+    ,[  True, True, True, True,False,False, True, True ]
+    ,[ False,False,False,False,False,False, True, True ]
+    ,[ False,False,False,False,False,False, True, True ]
+    ,[ False,False,False,False, True, True, True, True ]
+    ,[ False,False,False,False, True, True, True,False ]
+    ]
+
+bm = fromLists [
+    [0,0,0,0,0,0,0,0],
+    [0,0,0,0,0,0,0,0],
+    [0,0,0,0,1,1,1,0],
+    [0,0,0,0,1,1,0,0],
+    [1,1,1,1,1,1,0,0],
+    [1,1,1,1,1,1,0,0],
+    [1,1,1,1,0,0,0,0],
+    [1,1,1,1,0,0,0,1]]
+
+qt = bm2qt bm
+
+-- * pergunta 4
+
+data FTree a b = Unit b | Comp a (FTree a b) (FTree a b) deriving (Eq,Show)
+type PTree = FTree Square Square
+type Square = Float
+
+inFTree :: Either b (a, (FTree a b, FTree a b)) -> FTree a b
+outFTree :: FTree a1 a2 -> Either a2 (a1, (FTree a1 a2, FTree a1 a2))
+baseFTree :: (a1 -> b1) -> (a2 -> b2) -> (a3 -> d) -> Either a2 (a1, (a3, a3)) -> Either b2 (b1, (d, d))
+recFTree :: (a -> d) -> Either b1 (b2, (a, a)) -> Either b1 (b2, (d, d))
+cataFTree :: (Either b1 (b2, (d, d)) -> d) -> FTree b2 b1 -> d
+anaFTree :: (a1 -> Either b (a2, (a1, a1))) -> a1 -> FTree a2 b
+hyloFTree :: (Either b1 (b2, (c, c)) -> c) -> (a -> Either b1 (b2, (a, a))) -> a -> c
+
+depthFTree :: FTree a b -> Int
+depthFTree = cataFTree (either (const 0) g)
+    where g (a,(l,r)) = max l r + 1
+    
+isBalancedFTree :: FTree a b -> Bool
+isBalancedFTree = isJust . cataFTree (either (const (Just 0)) g)
+    where
+    g (a,(l,r)) = join (liftA2 equal l r)
+    equal x y = if x == y then Just (x+1) else Nothing
+\end{code}
+%endif
+
+%----------------- Fim do documento -------------------------------------------%
+
+\end{document}
+
0 comments on commit 272c2c6
@brunof17

Attach files by dragging & dropping,

, or pasting from the clipboard.
Styling with Markdown is supported

You’re not receiving notifications from this thread.

    © 2018 GitHub, Inc.
    Terms
    Privacy
    Security
    Status
    Help

    Contact GitHub
    API
    Training
    Shop
    Blog
    About

Press h to open a hovercard with more details.
