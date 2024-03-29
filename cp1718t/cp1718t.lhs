\documentclass{article}
\usepackage[a4paper,left=3cm,right=2cm,top=2.5cm,bottom=2.5cm]{geometry}
\usepackage{palatino}
\usepackage[colorlinks=true,linkcolor=blue,citecolor=blue]{hyperref}
\usepackage{graphicx}
\usepackage{cp1718t}
\usepackage{subcaption}
\usepackage{adjustbox}
%================= lhs2tex=====================================================%
%include polycode.fmt 
%format (div (x)(y)) = x "\div " y
%format succ = "\succ "
%format ==> = "\Longrightarrow "
%format map = "\map "
%format length = "\length "
%format fst = "\p1"
%format p1  = "\p1"
%format snd = "\p2"
%format p2  = "\p2"
%format Left = "i_1"
%format Right = "i_2"
%format i1 = "i_1"
%format i2 = "i_2"
%format >< = "\times"
%format >|<  = "\bowtie "
%format |-> = "\mapsto"
%format . = "\comp "
%format (kcomp (f)(g)) = f "\kcomp " g
%format -|- = "+"
%format conc = "\mathsf{conc}"
%format summation = "{\sum}"
%format (either (a) (b)) = "\alt{" a "}{" b "}"
%format (frac (a) (b)) = "\frac{" a "}{" b "}"
%format (uncurry f) = "\uncurry{" f "}"
%format (const f) = "\underline{" f "}"
%format TLTree = "\mathsf{TLTree}"
%format (lcbr (x)(y)) = "\begin{lcbr}" x "\\" y "\end{lcbr}"
%format (split (x) (y)) = "\conj{" x "}{" y "}"
%format for f i = "\mathsf{for}\ " f "\ " i
%format B_tree = "\mathsf{B}\mbox{-}\mathsf{tree} "
\def\ana#1{\mathopen{[\!(}#1\mathclose{)\!]}}
%format (cataA (f) (g)) = "\cata{" f "~" g "}_A"
%format (anaA (f) (g)) = "\ana{" f "~" g "}_A"
%format (cataB (f) (g)) = "\cata{" f "~" g "}_B"
%format (anaB (f) (g)) = "\ana{" f "~" g "}_B"
%format Either a b = a "+" b 
%format fmap = "\mathsf{fmap}"
%format NA   = "\textsc{na}"
%format NB   = "\textsc{nb}"
%format inT = "\mathsf{in}"
%format outT = "\mathsf{out}"
%format Null = "1"
%format (Prod (a) (b)) = a >< b
%format fF = "\fun F "
%format e1 = "e_1 "
%format e2 = "e_2 "
%format Dist = "\fun{Dist}"
%format IO = "\fun{IO}"
%format BTree = "\fun{BTree} "
%format LTree = "\mathsf{LTree}"
%format inNat = "\mathsf{in}"
%format (cataNat (g)) = "\cata{" g "}"
%format Nat0 = "\N_0"
%format muB = "\mu "
%format (frac (n)(m)) = "\frac{" n "}{" m "}"
%format (fac (n)) = "{" n "!}"
%format (underbrace (t) (p)) = "\underbrace{" t "}_{" p "}"
%format matrix = "matrix"
%format (bin (n) (k)) = "\Big(\vcenter{\xymatrix@R=1pt{" n "\\" k "}}\Big)"
%format `ominus` = "\mathbin{\ominus}"
%format % = "\mathbin{/}"
%format <-> = "{\,\leftrightarrow\,}"
%format <|> = "{\,\updownarrow\,}"
%format `minusNat`= "\mathbin{-}"
%format ==> = "\Rightarrow"
%format .==>. = "\Rightarrow"
%format .<==>. = "\Leftrightarrow"
%format .==. = "\equiv"
%format .<=. = "\leq"

%---------------------------------------------------------------------------

\title{
       	    Cálculo de Programas
\\
       	Trabalho Prático
\\
       	MiEI+LCC --- 2017/18
}

\author{
       	\dium
\\
       	Universidade do Minho
}


\date\mydate

\makeindex

\begin{document}

\maketitle

\begin{center}\large
\begin{tabular}{ll}
\textbf{Grupo} nr. & 82 (preencher)
\\\hline
a73700 & Sara Alexandra da Silva Pereira
\\
a74155 & Bruno Filipe da Silva Ferreira 
\\
a74813 & André Filipe de Araújo Pereira de Sousa
\end{tabular}
\end{center}

\section{Preâmbulo}

A disciplina de \CP\ tem como objectivo principal ensinar
a progra\-mação de computadores como uma disciplina científica. Para isso
parte-se de um repertório de \emph{combinadores} que formam uma álgebra da
programação (conjunto de leis universais e seus corolários) e usam-se esses
combinadores para construir programas \emph{composicionalmente}, isto é,
agregando programas já existentes.
  
Na sequência pedagógica dos planos de estudo dos dois cursos que têm esta
disciplina, restringe-se a aplicação deste método à programação funcional
em \Haskell. Assim, 
o presente trabalho prático coloca os alunos perante problemas
concretos que deverão ser implementados em \Haskell.
Há ainda um outro objectivo: o de ensinar a documentar programas e
a produzir textos técnico-científicos de qualidade.

\section{Documentação}
Para cumprir de forma integrada os objectivos enunciados acima vamos recorrer
a uma técnica de programa\-ção dita ``\litp{literária}'' \cite{Kn92}, cujo
princípio base é o seguinte:
\begin{quote}\em
Um programa e a sua documentação devem coincidir.
\end{quote}
Por outras palavras, o código fonte e a documentação de um programa deverão estar no
mesmo ficheiro.

O ficheiro \texttt{cp1718t.pdf} que está a ler é já um exemplo de \litp{programação
literária}: foi gerado a partir do texto fonte \texttt{cp1718t.lhs}\footnote{O
suffixo `lhs' quer dizer \emph{\lhaskell{literate Haskell}}.} que encontrará
no \MaterialPedagogico\ desta disciplina descompactando o ficheiro \texttt{cp1718t.zip}
e executando
\begin{Verbatim}[fontsize=\small]
    $ lhs2TeX cp1718t.lhs > cp1718t.tex
    $ pdflatex cp1718t
\end{Verbatim}
em que \href{https://hackage.haskell.org/package/lhs2tex}{\texttt\LhsToTeX} é
um pre-processador que faz ``pretty printing''
de código Haskell em \Latex\ e que deve desde já instalar executando
\begin{Verbatim}[fontsize=\small]
    $ cabal install lhs2tex
\end{Verbatim}
Por outro lado, o mesmo ficheiro \texttt{cp1718t.lhs} é executável e contém
o ``kit'' básico, escrito em \Haskell, para realizar o trabalho. Basta executar
\begin{Verbatim}[fontsize=\small]
    $ ghci cp1718t.lhs
\end{Verbatim}

%if False
\begin{code}
{-# LANGUAGE GeneralizedNewtypeDeriving, DeriveDataTypeable #-}
import Cp
import List  hiding (fac)
import Nat  
import Probability hiding (cond)
import BMP

import Data.List
import Data.Typeable
import Data.Ratio
import Data.Bifunctor
import Data.Maybe
import Data.Matrix hiding ((!))
import Test.QuickCheck hiding ((><),choose)
import qualified Test.QuickCheck as QuickCheck
import System.Random  hiding (split)
import GHC.IO.Exception
import Codec.Picture.Types
import Graphics.Gloss
import Control.Monad
import Control.Applicative hiding ((<|>))
\end{code}
%endif

\noindent Abra o ficheiro \texttt{cp1718t.lhs} no seu editor de texto preferido
e verifique que assim é: todo o texto que se encontra dentro do ambiente
\begin{quote}\small\tt
\verb!\begin{code}!
\\ ... \\
\verb!\end{code}!
\end{quote}
vai ser seleccionado pelo \GHCi\ para ser executado.

\section{Como realizar o trabalho}
Este trabalho teórico-prático deve ser realizado por grupos de três alunos.
Os detalhes da avaliação (datas para submissão do relatório e sua defesa
oral) são os que forem publicados na \cp{página da disciplina} na \emph{internet}.

Recomenda-se uma abordagem participativa dos membros do grupo
de trabalho por forma a poderem responder às questões que serão colocadas
na \emph{defesa oral} do relatório.

Em que consiste, então, o \emph{relatório} a que se refere o parágrafo anterior?
É a edição do texto que está a ser lido, preenchendo o anexo \ref{sec:resolucao}
com as respostas. O relatório deverá conter ainda a identificação dos membros
do grupo de trabalho, no local respectivo da folha de rosto.

Para gerar o PDF integral do relatório deve-se ainda correr os comando seguintes,
que actualizam a bibliografia (com \Bibtex) e o índice remissivo (com \Makeindex),
\begin{Verbatim}[fontsize=\small]
    $ bibtex cp1718t.aux
    $ makeindex cp1718t.idx
\end{Verbatim}
e recompilar o texto como acima se indicou. Dever-se-á ainda instalar o utilitário
\QuickCheck,
que ajuda a validar programas em \Haskell, a biblioteca
\href{https://hackage.haskell.org/package/JuicyPixels}{JuicyPixels} para processamento
de imagens e a biblioteca \href{http://gloss.ouroborus.net/}{gloss} para geração de gráficos 2D:
\begin{Verbatim}[fontsize=\small]
    $ cabal install QuickCheck JuicyPixels gloss
\end{Verbatim}
Para testar uma propriedade \QuickCheck~|prop|, basta invocá-la com o comando:
\begin{verbatim}
    > quickCheck prop
    +++ OK, passed 100 tests.
\end{verbatim}

\section*{Problema 1}

Segundo uma \href{https://www.jn.pt/economia/interior/compra-diaria-de-bitcoins-iguala-acoes-da-apple-9257302.html}{notícia do Jornal de Notícias}, 
referente ao dia 12 de abril, \emph{``apenas numa hora, foram transacionadas 1.2 mil milhões de dólares em bitcoins. Nas últimas 24 horas, foram transacionados 8,5 mil milhões de dólares, num total de 24 mil milhões de dólares referentes às principais criptomoedas''}.

De facto, é inquestionável que as criptomoedas, e em particular as bitcoin, vieram para ficar.
%
Várias moedas digitais, e em particular as bitcoin, usam a tecnologia de block chain
para guardar e assegurar todas as transações relacionadas com a moeda.
%
Uma \href{https://en.bitcoin.it/wiki/Block_chain}{block chain} é uma coleção de blocos que registam os movimentos da moeda; a sua definição em Haskell é apresentada de seguida.

\begin{spec}
data Blockchain = Bc {bc :: Block}  |  Bcs {bcs :: (Block, Blockchain)} deriving Show
\end{spec}

Cada \href{https://en.bitcoin.it/wiki/Block}{bloco} numa block chain
regista um número (mágico) único, o momento da execução, e uma lista de transações,
tal como no código seguinte:

\begin{spec}
type Block = (MagicNo, (Time, Transactions))
\end{spec}

Cada \href{https://en.bitcoin.it/wiki/Transaction}{transação} 
define a entidade de origem da transferência, o valor a ser transacionado,
e a entidade destino (por esta ordem), tal como se define de seguida.

\begin{spec}
type Transaction = (Entity, (Value, Entity))
type Transactions = [Transaction]
\end{spec}

A partir de uma block chain, é possível calcular o valor que cada entidade
detém, tipicamente designado de ledger:

\begin{spec}
type Ledger = [(Entity, Value)]
\end{spec}

Seguem as restantes definições Haskell para completar o código anterior.
Note que |Time| representa o momento da transação, como o número de \href{https://currentmillis.com}{milisegundos} que passaram desde 1970.

\begin{spec}
type MagicNo = String
type Time = Int  -- em milisegundos
type Entity = String
type Value = Int
\end{spec}

Neste contexto, implemente as seguintes funções:

\begin{enumerate}
\item Defina a função |allTransactions :: Blockchain -> Transactions|, como um catamorfismo, que calcula a lista com todas as transações numa dada block chain.

%if False
\begin{code}
allTransactions :: Blockchain -> Transactions
prop1a :: Blockchain -> Bool
\end{code}
%endif

\begin{propriedade}
    As transações de uma block chain são as mesmas da block chain revertida:
\begin{code}
prop1a = sort . allTransactions .==. sort . allTransactions . reverseChain
\end{code}

Note que a função |sort| é usada apenas para facilitar a comparação das listas.
\end{propriedade}

\item Defina a função |ledger :: Blockchain -> Ledger|, utilizando catamorfismos e/ou anamorfismos, que calcula o ledger (i.e., o valor disponível) de cada entidade numa uma dada block chain.
    Note que as entidades podem ter valores negativos; de facto isso acontecerá para a primeira transação que executarem.

%if False
\begin{code}
ledger :: Blockchain -> Ledger
prop1b :: Blockchain -> Bool
prop1c :: Blockchain -> Bool
\end{code}
%endif

\begin{propriedade}
    O tamanho do ledger é inferior ou igual a duas vezes o tamanho de todas as transações:
\begin{code}
prop1b = length . ledger .<=. (2*) . length . allTransactions
\end{code}
\end{propriedade}

\begin{propriedade}
    O ledger de uma block chain é igual ao ledger da sua inversa:
\begin{code}
prop1c = sort . ledger .==. sort . ledger . reverseChain
\end{code}
\end{propriedade}



\item Defina a função |isValidMagicNr :: Blockchain -> Bool|, utilizando catamorfismos e/ou anamorfismos, que verifica se todos os números mágicos numa dada block chain são únicos.

%if False
\begin{code}
isValidMagicNr :: Blockchain -> Bool
prop1d :: Blockchain -> Bool
prop1e :: Blockchain -> Property
\end{code}
%endif

\begin{propriedade}
    A concatenação de uma block chain com ela mesma nunca é válida em termos de números mágicos:
\begin{code}
prop1d = not . isValidMagicNr . concChain . (split id id)
\end{code}
\end{propriedade}

\begin{propriedade}
    Se uma block chain é válida em termos de números mágicos, então a sua inversa também o é:
\begin{code}
prop1e = isValidMagicNr .==>. isValidMagicNr . reverseChain
\end{code}
\end{propriedade}

\end{enumerate}



\section*{Problema 2}

Uma estrutura de dados frequentemente utilizada para representação e processamento de imagens de forma eficiente são as denominadas \href{https://en.wikipedia.org/wiki/Quadtree}{quadtrees}.
Uma \emph{quadtree} é uma árvore quaternária em que cada nodo tem quatro sub-árvores e cada folha representa um valor bi-dimensional.
\begin{spec}
data QTree a = Cell a Int Int | Block (QTree a) (QTree a) (QTree a) (QTree a)
  deriving (Eq,Show)
\end{spec}

\begin{figure}
\begin{subfigure}{0.3\textwidth}
\begin{verbatim}
( 0 0 0 0 0 0 0 0 )
( 0 0 0 0 0 0 0 0 )
( 0 0 0 0 1 1 1 0 )
( 0 0 0 0 1 1 0 0 )
( 1 1 1 1 1 1 0 0 )
( 1 1 1 1 1 1 0 0 )
( 1 1 1 1 0 0 0 0 )
( 1 1 1 1 0 0 0 1 )
\end{verbatim}
\caption{Matriz de exemplo |bm|.}
\label{fig:bm}
\end{subfigure}
\begin{subfigure}{0.7\textwidth}
\begin{verbatim}
Block
 (Cell 0 4 4) (Block
  (Cell 0 2 2) (Cell 0 2 2) (Cell 1 2 2) (Block
   (Cell 1 1 1) (Cell 0 1 1) (Cell 0 1 1) (Cell 0 1 1)))
 (Cell 1 4 4)
 (Block
  (Cell 1 2 2) (Cell 0 2 2) (Cell 0 2 2) (Block
   (Cell 0 1 1) (Cell 0 1 1) (Cell 0 1 1) (Cell 1 1 1)))
\end{verbatim}
\caption{Quadtree de exemplo |qt|.}
\label{fig:qt}
\end{subfigure}
\caption{Exemplos de representações de bitmaps.}
\end{figure}

Uma imagem monocromática em formato bitmap pode ser representada como uma
matriz de bits\footnote{Cf.\ módulo \href{https://hackage.haskell.org/package/matrix}{|Data.Matrix|}.},
tal como se exemplifica na Figura~\ref{fig:bm}.

O anamorfismo |bm2qt| converte um bitmap em forma matricial na sua codificação eficiente em quadtrees, e o catamorfismo |qt2bm| executa a operação inversa:

\adjustbox{valign=t}{\begin{minipage}{.5\textwidth} %
\begingroup
\leftskip-1.5em
\rightskip\leftskip
\begin{code}
bm2qt :: (Eq a) => Matrix a -> QTree a
bm2qt = anaQTree f where
    f m = if one then i1 u else i2 (a,(b,(c,d)))
     where  x = (nub . toList) m
            u = (head x,(ncols m,nrows m))
            one = (ncols m == 1 || nrows m == 1 || length x == 1)
            (a,b,c,d) = splitBlocks (nrows m `div` 2) (ncols m `div` 2) m    
\end{code}
\endgroup
\end{minipage}} %
\adjustbox{valign=t}{\begin{minipage}{.5\textwidth} %
\begingroup
\leftskip-2em
\rightskip\leftskip
\begin{code}
qt2bm :: (Eq a) => QTree a -> Matrix a
qt2bm = cataQTree (either f g) where
    f (k,(i,j)) = matrix j i (const k)
    g (a,(b,(c,d))) = (a <|> b) <-> (c <|> d)
\end{code}
\endgroup
\end{minipage}}

O algoritmo |bm2qt| particiona recursivamente a imagem em $4$ blocos e termina produzindo folhas para matrizes unitárias ou quando todos os píxeis de um sub-bloco têm a mesma côr.
Para a matriz |bm| de exemplo, a quadtree correspondente |qt = bm2qt bm| é ilustrada na Figura~\ref{fig:qt}.

\begin{figure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/person.png}
\caption{Bitmap de exemplo.}
\label{fig:person}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[height=0.2\linewidth]{cp1718t_media/person90.png}
\caption{Rotação.}
\label{fig:person90}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.4\linewidth]{cp1718t_media/personx2.png}
\caption{Redimensionamento.}
\label{fig:personx2}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/personinv.png}
\caption{Inversão de cores.}
\label{fig:personinv}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/person1.png}
\caption{Compresão de $1$ nível.}
\label{fig:person1}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/person2.png}
\caption{Compressão de $2$ níveis.}
\label{fig:person2}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/person3.png}
\caption{Compressão de $3$ níveis.}
\label{fig:person3}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/person4.png}
\caption{Compressão de $4$ níveis.}
\label{fig:person4}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/personOut1.png}
\caption{Bitmap de contorno.}
\label{fig:personOut1}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/personOut2.png}
\caption{Bitmap com contorno.}
\label{fig:personOut2}
\end{subfigure}
%
\caption{Manipulação de uma figura bitmap utilizando quadtrees.}
\end{figure}

Imagens a cores podem ser representadas como matrizes de píxeis segundo o código de cores \href{https://en.wikipedia.org/wiki/RGBA_color_space}{RGBA}, codificado no tipo \href{https://hackage.haskell.org/package/JuicyPixels-3.2.9.5/docs/Codec-Picture.html#t:PixelRGBA8}{|PixelRGBA8|} em que cada pixel é um quádruplo de valores inteiros $(red,green,blue,alpha)$ contidos entre $0$ e $255$.
Atente em alguns exemplos de cores:
\begin{spec}
whitePx  = PixelRGBA8 255 255 255 255
blackPx  = PixelRGBA8 0 0 0 255
redPx    = PixelRGBA8 255 0 0 255
\end{spec}

O módulo |BMP|, disponibilizado juntamente com o enunciado, fornece funções para processar ficheiros de imagem bitmap como matrizes:
\begin{spec}
    readBMP :: FilePath -> IO (Matrix PixelRGBA8)
    writeBMP :: FilePath -> Matrix PixelRGBA8 -> IO ()
\end{spec}

Teste, por exemplo, no |GHCi|, carregar a Figura~\ref{fig:person}:
\begin{verbatim}
    > readBMP "cp1718t_media/person.bmp"
\end{verbatim} 

Esta questão aborda operações de processamento de imagens utilizando quadtrees:
\begin{enumerate}
    \item Defina as funções |rotateQTree :: QTree a -> QTree a|, |scaleQTree :: Int -> QTree a -> QTree a| e |invertQTree :: QTree a -> QTree a|, como catamorfismos e/ou anamorfismos, que rodam\footnote{Segundo um ângulo de $90º$ no sentido dos ponteiros do relógio.}, redimensionam \footnote{Multiplicando o seu tamanho pelo valor recebido.} e invertem as cores de uma quadtree\footnote{Um pixel pode ser invertido calculando $255 - c$ para cada componente $c$ de cor RGB, exceptuando o componente alpha.}, respectivamente.
    Tente produzir imagens similares às Figuras~\ref{fig:person90}, \ref{fig:personx2} e \ref{fig:personinv}:
%if False
\begin{code}
rotateQTree :: QTree a -> QTree a
scaleQTree :: Int -> QTree a -> QTree a
invertQTree :: QTree PixelRGBA8 -> QTree PixelRGBA8
prop2c :: QTree Int -> Bool
prop2d :: Nat -> QTree Int -> Bool
prop2e :: QTree PixelRGBA8 -> Bool
\end{code}
%endif
        \begin{verbatim}
    > rotateBMP  "cp1718t_media/person.bmp" "person90.bmp"
    > scaleBMP 2 "cp1718t_media/person.bmp" "personx2.bmp"
    > invertBMP  "cp1718t_media/person.bmp" "personinv.bmp"
        \end{verbatim}

\begin{propriedade}
        Rodar uma quadtree é equivalente a rodar a matriz correspondente:
\begin{code}
prop2c = rotateMatrix . qt2bm .==. qt2bm . rotateQTree
\end{code}
    \end{propriedade}
\begin{propriedade}
    Redimensionar uma imagem altera o seu tamanho na mesma proporção:
\begin{code}
prop2d (Nat s) = sizeQTree . scaleQTree s .==. ((s*) >< (s*)) . sizeQTree
\end{code}
\end{propriedade}
\begin{propriedade}
    Inverter as cores de uma quadtree preserva a sua estrutura:
\begin{code}
prop2e = shapeQTree . invertQTree .==. shapeQTree
\end{code}
\end{propriedade}
    
    \item Defina a função |compressQTree :: Int -> QTree a -> QTree a|, utilizando catamorfismos e/ou anamorfismos, que comprime uma quadtree cortando folhas da árvore para reduzir a sua profundidade num dado número de níveis.
    Tente produzir imagens similares (mas não necessariamente iguais) às Figuras~\ref{fig:person1}, \ref{fig:person2}, \ref{fig:person3} e \ref{fig:person4}:
%if False
\begin{code}
compressQTree :: Int -> QTree a -> QTree a
prop2f :: Nat -> QTree Int -> Bool
\end{code}
%endif
        \begin{verbatim}
    > compressBMP 1 "cp1718t_media/person.bmp" "person1.bmp"
    > compressBMP 2 "cp1718t_media/person.bmp" "person2.bmp"
    > compressBMP 3 "cp1718t_media/person.bmp" "person3.bmp"
    > compressBMP 4 "cp1718t_media/person.bmp" "person4.bmp"
        \end{verbatim}
    \begin{propriedade}
        A quadtree comprimida tem profundidade igual à da quadtree original menos a taxa de compressão:
\begin{code}
prop2f (Nat n) = depthQTree . compressQTree n .==. (`minusNat` n) . depthQTree
\end{code}
    \end{propriedade}
    

    \item Defina a função |outlineQTree :: (a -> Bool) -> QTree a -> Matrix Bool|, utilizando catamorfismos e/ou anamorfismos, que recebe uma função que determina quais os píxeis de fundo e converte uma quadtree numa matriz monocromática, de forma a desenhar o contorno de uma \href{https://en.wikipedia.org/wiki/Polygon_mesh}{malha poligonal} contida na imagem.
        Tente produzir imagens similares (mas não necessariamente iguais) às Figuras~\ref{fig:personOut1} e \ref{fig:personOut2}:
%if False
\begin{code}
outlineQTree :: (a -> Bool) -> QTree a -> Matrix Bool
\end{code}
%endif
            \begin{verbatim}
    > outlineBMP    "cp1718t_media/person.bmp" "personOut1.bmp"
    > addOutlineBMP "cp1718t_media/person.bmp" "personOut2.bmp"
            \end{verbatim}
%if False
\begin{code}
prop2g :: QTree Int -> Bool
\end{code}
%endif
    \begin{propriedade}
        A matriz de contorno tem dimensões iguais às da quadtree:
\begin{code}
prop2g = sizeQTree .==. sizeMatrix . outlineQTree (<0)
\end{code}
    \end{propriedade}
    \begin{teste}
        Contorno da quadtree de exemplo |qt|:
\begin{code}
teste2a = outlineQTree (==0) qt == qtOut 
\end{code}
    \end{teste}

\end{enumerate}

\section*{Problema 3}
O cálculo das combinações de |n| |k|-a-|k|,
\begin{eqnarray}
	|bin n k = frac (fac n)(fac k * (fac ((n-k))))|
	\label{eq:bin} 
\end{eqnarray}
envolve três factoriais. Recorrendo à \material{lei de recursividade múltipla} do cálculo
de programas, é possível escrever o mesmo programa como um simples ciclo-for
onde se fazem apenas multiplicações e somas. Para isso, começa-se por estruturar
a definição dada da forma seguinte,
\begin{eqnarray*}
	|bin n k = h k (n - k)|
\end{eqnarray*}
onde
\begin{eqnarray*}
\start
       |h k d = frac (f k d) (g d)|
\more
       |f k d = frac (fac ((d+k))) (fac k)|
\more
       |g d = fac d| 
\end{eqnarray*}
assumindo-se |d = n-k >=0|.
%
É fácil de ver que |f k| e |g| se desdobram em 4 funções mutuamente recursivas, a saber
\begin{spec}
f k 0 = 1
f k (d+1) = underbrace ((d+k+1)) (l k d) * f k d

l k 0 = k+1
l k (d+1) = l k d + 1
\end{spec}
e 
\begin{spec}
g 0 = 1
g (d+1) = underbrace ((d+1)) (s d) * g d

s 0 = 1
s (d+1) = s d + 1
\end{spec}
A partir daqui alguém derivou a seguinte implementação:
\begin{code}
bin n k = h k (n-k) where  h k n = let (a,_,b,_) = for loop (base k) n in a % b
\end{code}
Aplicando a lei da recursividade múltipla para |split (f k) (l k)| e para
|split g s| e combinando os resultados com a \material{lei de banana-split},
derive as funções |base k| e |loop| que são usadas como auxiliares acima.

\begin{propriedade}
Verificação que |bin n k| coincide com a sua especificação (\ref{eq:bin}):
\begin{code}
prop3 (NonNegative n) (NonNegative k) = k <= n ==> (bin n k) == (fac n) % (fac k * (fac ((n-k))))
\end{code}
\end{propriedade}

\section*{Problema 4}

\begin{figure}
\begin{center}
\includegraphics[width=0.7\textwidth]{cp1718t_media/pythagoras-tree1.png}
\end{center}
\caption{Passos de construção de uma árvore de Pitágoras de ordem $3$.}
\label{fig:pitagoras1}
\end{figure}

\href{https://en.wikipedia.org/wiki/Fractal}{Fractais} são formas geométricas que podem ser construídas recursivamente de acordo com um conjunto de equações matemáticas.
Um exemplo clássico de um fractal são as \href{https://en.wikipedia.org/wiki/Pythagoras_tree_(fractal)}{árvores de Pitágoras}.
A construção de uma árvore de Pitágoras começa com um quadrado, ao qual se unem dois quadrados redimensionados pela escala $\sqrt{2}/2$, de forma a que os cantos dos $3$ quadrados coincidam e formem um triângulo rectângulo isósceles.
Este procedimento é repetido recursivamente de acordo com uma dada ordem, definida como um número natural (Figura~\ref{fig:pitagoras1}).

Uma árvore de Pitágoras pode ser codificada em Haskell como uma full tree contendo quadrados nos nodos e nas folhas, sendo um quadrado definido simplesmente pelo tamanho do seu lado:
\begin{spec}
data FTree a b = Unit b | Comp a (FTree a b) (FTree a b) deriving (Eq,Show)
type PTree = FTree Square Square
type Square = Float
\end{spec}

\begin{enumerate}
    \item Defina a função |generatePTree :: Int -> PTree|, como um anamorfismo, que gera uma árvore de Pitágoras para uma dada ordem.

%if False
\begin{code}
generatePTree :: Int -> PTree
prop4a :: SmallNat -> Bool
prop4b :: SmallNat -> Bool
\end{code}
%endif

\begin{propriedade}
    Uma árvore de Pitágoras tem profundidade igual à sua ordem:
\begin{code}
prop4a (SmallNat n) = (depthFTree . generatePTree) n == n
\end{code}
\end{propriedade}
\begin{propriedade}
    Uma árvore de Pitágoras está sempre balanceada:
\begin{code}
prop4b (SmallNat n) = (isBalancedFTree . generatePTree) n
\end{code}
\end{propriedade}

\item Defina a função |drawPTree :: PTree -> [Picture]|, utilizando catamorfismos e/ou anamorfismos, que anima incrementalmente os passos de construção de uma árvore de Pitágoras recorrendo à biblioteca \href{https://hackage.haskell.org/package/gloss}{gloss}.
    Anime a sua solução:
\begin{verbatim}
    > animatePTree 3
\end{verbatim}

%if False
\begin{code}
drawPTree :: PTree -> [Picture]

window = (InWindow "CP" (800,800) (0,0))
square s = rectangleSolid s s

animatetePTree n = animate window white draw
    where
    pics = drawPTree (generatePTree n)
    draw t = pics !! (floor (t/2))
\end{code}
%endif
    
\end{enumerate}

\section*{Problema 5}

Uma das áreas em maior expansão no campo da informática é a análise de dados
e  \href{https://www.mathworks.com/discovery/machine-learning.html}{machine learning}. Esta questão aborda um \emph{mónade} que ajuda
a fazer, de forma simples, as operações básicas dessas técnicas. Esse mónade
é conhecido por \emph{bag}, \emph{saco} ou \emph{multi-conjunto}, permitindo
que os elementos de um conjunto tenham multiplicidades associadas. Por exemplo,
seja
\begin{code}
data Marble = Red | Pink | Green | Blue | White deriving (Read,Show,Eq,Ord)
\end{code}
um tipo dado.\footnote{``Marble" traduz para ``berlinde" em português.}
A lista |[ Pink,Green,Red,Blue,Green,Red,Green,Pink,Blue,White ]| tem elementos
repetidos. Assumindo que a ordem não é importante, essa lista corresponde ao saco
\begin{quote}\small
\begin{verbatim}
{ Red |-> 2 , Pink |-> 2 , Green |-> 3 , Blue |-> 2 , White |-> 1 }
\end{verbatim}
\end{quote}
que habita o tipo genérico dos ``bags":
\begin{code}
data Bag a = B [(a,Int)] deriving (Ord)
\end{code}
O mónade que vamos construir sobre este tipo de dados faz a gestão automática das multiciplidades.
Por exemplo, seja dada a função que dá o peso de cada berlinde em gramas:
\begin{code}
marbleWeight :: Marble -> Int
marbleWeight Red   = 3
marbleWeight Pink  = 2
marbleWeight Green = 3
marbleWeight Blue  = 6
marbleWeight White = 2
\end{code}
Então, se quisermos saber quantos \emph{berlindes} temos, de cada \emph{peso}, não teremos que fazer contas:
basta calcular
\begin{code}
marbleWeights = fmap marbleWeight bagOfMarbles
\end{code}
onde |bagOfMarbles| é o saco de berlindes referido acima, obtendo-se:
\begin{quote}\small
	\verb!{ 2 |-> 3 , 3 |-> 5 , 6 |-> 2 }!.
\end{quote}
%
Mais ainda, se quisermos saber o total de berlindes em |bagOfMarbles| basta
calcular |fmap (!) bagOfMarbles| obtendo-se \verb!{ () |-> 10 }!; isto é,
o saco tem |10| berlindes no total.


Finalmente, se quisermos saber a probabilidade da cor de um berlinde que tiremos do saco, basta converter
o referido saco numa distribuição correndo:
\begin{code}
marblesDist = dist bagOfMarbles
\end{code}
obtendo-se a distribuição (graças ao módulo \Probability):
\begin{quote}\small
\begin{verbatim}
Green  30.0%
  Red  20.0%
 Pink  20.0%
 Blue  20.0%
White  10.0%
\end{verbatim}
\end{quote}
cf.\ Figura \ref{fig:dist}.

\begin{figure}
\begin{center}
\includegraphics[width=0.4\textwidth]{cp1718t_media/marblesDist-mod5.png}
\end{center}
\caption{Distribuição de berlindes num saco.}
\label{fig:dist}
\end{figure}

Partindo da seguinte declaração de |Bag| como um functor e como um mónade,
\begin{code}
instance Functor Bag where
    fmap f = B. map (f><id) . unB

instance Monad Bag where
   x >>= f = (muB.fmap f) x where
   return = singletonbag
\end{code}
\begin{enumerate}
\item	
Defina a função |muB| (multiplicação do mónade |Bag|) e a função auxiliar
|singletonbag|.
\item	Verifique-as com os seguintes testes unitários:
%if False
\begin{code}
muB :: Bag (Bag a) -> Bag a
\end{code}
%endif
\begin{teste}
Lei |muB.return=id|:
\begin{code}
test5a = bagOfMarbles == muB (return bagOfMarbles)
\end{code}
\end{teste}
\begin{teste}
Lei |muB.muB = muB . fmap muB|:
\begin{code}
test5b = (muB . muB) b3 == (muB .fmap muB) b3
\end{code}
\vskip 1em
onde |b3| é um saco dado em anexo.
\end{teste}
\end{enumerate}

%----------------- Bibliografia (exige bibtex) --------------------------------%

\bibliographystyle{plain}
\bibliography{cp1718t}

%----------------- Programa, bibliotecas e código auxiliar --------------------%

\newpage

\part*{Anexos}

\appendix

\section{Mónade para probabilidades e estatística}\label{sec:Dist}
%format B = "\mathit B"
%format C = "\mathit C"
Mónades são functores com propriedades adicionais que nos permitem obter
efeitos especiais em progra\-mação. Por exemplo, a biblioteca \Probability\
oferece um mónade para abordar problemas de probabilidades. Nesta biblioteca,
o conceito de distribuição estatística é captado pelo tipo
\begin{eqnarray}
	|newtype Dist a = D {unD :: [(a, ProbRep)]}|
	\label{eq:Dist}
\end{eqnarray}
em que |ProbRep| é um real de |0| a |1|, equivalente a uma escala de |0| a |100%|.

Cada par |(a,p)| numa distribuição |d::Dist a| indica que a probabilidade
de |a| é |p|, devendo ser garantida a propriedade de  que todas as probabilidades
de |d| somam |100%|.
Por exemplo, a seguinte distribuição de classificações por escalões de $A$ a $E$,
\[
\begin{array}{ll}
A & \rule{2mm}{3pt}\ 2\%\\
B & \rule{12mm}{3pt}\ 12\%\\
C & \rule{29mm}{3pt}\ 29\%\\
D & \rule{35mm}{3pt}\ 35\%\\
E & \rule{22mm}{3pt}\ 22\%\\
\end{array}
\]
será representada pela distribuição
\begin{code}
d1 :: Dist Char
d1 = D [('A',0.02),('B',0.12),('C',0.29),('D',0.35),('E',0.22)]
\end{code}
que o \GHCi\ mostrará assim:
\begin{Verbatim}[fontsize=\small]
'D'  35.0%
'C'  29.0%
'E'  22.0%
'B'  12.0%
'A'   2.0%
\end{Verbatim}

Este mónade é adequado à resolução de problemas de \emph{probabilidades e
estatística} usando programação funcional, de forma elegante e como caso
particular de programação monádica.

\section{Definições auxiliares}\label{sec:helper_functions}
Funções para mostrar \emph{bags}:
\begin{code}
instance (Show a, Ord a, Eq a) => Show (Bag a) where
    show = showbag . consol . unB  where
       showbag = concat .
                 (++ [" }"]) .  ("{ ":) . 
                 (intersperse " , ") .
                 sort . 
                 (map f) where f(a,b) = (show a) ++ " |-> " ++ (show b)
unB (B x) = x
\end{code}
Igualdade de \emph{bags}:
\begin{code}
instance (Eq a) => Eq (Bag a) where
   b == b' = (unB b) `lequal` (unB b')
           where lequal a b = isempty (a `ominus` b)
                 ominus a b = a ++ neg b
                 neg x = [(k,-i) | (k,i) <- x]
\end{code}
Ainda sobre o mónade |Bag|:
\begin{code}
instance Applicative Bag where
    pure = return
    (<*>) = aap
\end{code}
O exemplo do texto:
\begin{code}
bagOfMarbles = B [(Pink,2),(Green,3),(Red,2),(Blue,2),(White,1)]
\end{code}
Um valor para teste (bags de bags de bags):
\begin{code}
b3 :: Bag (Bag (Bag Marble))
b3= B [(B [(B[(Pink,2),(Green,3),(Red,2),(Blue,2),(White,1)],5)
      ,(B [(Pink,1),(Green,2),(Red,1),(Blue,1)],2)],2)]
\end{code}
Outras funções auxiliares:
\begin{code}
a |-> b = (a,b)

consol :: (Eq b) => [(b, Int)] -> [(b, Int)]
consol = filter nzero . map (id >< sum) . col where nzero(_,x)=x/=0

isempty :: Eq a => [(a, Int)] -> Bool
isempty = all (==0) . map snd . consol

col x = nub [ k |-> [ d' | (k',d') <- x , k'==k ] | (k,d) <- x ]

consolidate :: Eq a => Bag a -> Bag a
consolidate = B . consol . unB

\end{code}

%----------------- Soluções dos alunos -----------------------------------------%

\section{Soluções dos alunos}\label{sec:resolucao}
Os alunos devem colocar neste anexo as suas soluções aos exercícios
propostos, de acordo com o ``layout'' que se fornece. Não podem ser
alterados os nomes ou tipos das funções dadas, mas pode ser adicionado texto e / ou 
outras funções auxiliares que sejam necessárias.

\subsection*{Problema 1}

\subsubsection{Definições iniciais}

Sabendo o tipo da nossa estrutura podemos verificar que este ou contém um \emph{Block}, denominado \emph{Bc} , ou contém um tuplo com um \emph{Block} e um \emph{BlockChain}, sendo o tuplo denominado \emph{Bcs}. Dessa maneira, dado um input, este será de um tipo ou do outro.

\begin{code}
inBlockchain = either Bc Bcs
\end{code}

No caso do \emph{out} queremos realizar a operação contrária, ou seja, criar apartir de uma \emph{BlockChain}, um tipo que tanto pode ser um \emph{Bc} ou um \emph{Bcs}. Assim, queremos aplicar à nossa \emph{BlockChain} a projeção à esquerda no caso desta ser um \emph{Bc} ou a projeção à direita no caso contrário.

\begin{code}
outBlockchain (Bc bc) =  i1 (bc)
outBlockchain (Bcs (bc,a)) = i2 (bc,a)
\end{code}

Ao defenir a função \emph{rec} estamos a defenir a função que trabalha sobre a soma que temos presente. Sendo dada uma função de transformação, esta será aplicada à parte do tipo que contem a informação do próximo elemento, neste caso sendo o \emph{BlockChain}, presente no tuplo \emph{Bcs}. Como verificado antes, temos um tipo que pode ser de dois tipos diferentes, assim para transformar esta soma é aplicado o co-produto na mesma, tendo assim criada a probabilidade de ser cada um dos tipos da soma. No entanto no lado direito da soma, temos presente um tipo que é um tuplo entre o tipo \emph{Bc} e o tipo \emph{Bcs}. Para tal é aplicado o produto neste tipo que transformaria o nosso tuplo no tuplo desejado.

\begin{code}
recBlockchain f = id -|- id >< f
\end{code}

A função \emph{cata} permite transformar um dado tipo de dados usando uma função que realiza esta tranformação. Essa função de transformação permite transformar uma dada soma num tipo de dados único. Para poder propagar a função pelo tipo é usada a função \emph{rec} definida anteriormente, no entanto, o tipo de dados recebido, \emph{BlockChain}, não corresponde ao tipo recebido pela nossa \emph{rec}. Para poder ultrupassar este problema é aplicada a função \emph{out} definida, obtendo assim o tipo de dados pretendidos, e só após aplicamos a função \emph{rec}. A função que será aplicada a cada elemento é a propria função \emph{cata} tendo como função de transformação a anterior, para que a mesma seja aplicada a cada elemento. Tendo feita a recursividade, podemos aplicar a função de transformação ao elemento atual. 

\begin{code}
cataBlockchain f =  f . recBlockchain(cataBlockchain f). outBlockchain
\end{code}


A função \emph{ana} pretende fazer o contrário, sendo a mesma aplicada inicialmente ao tipo uníco recebido, permitindo transformar o tipo recebido numa soma. Depois da mesma ser aplicada iriamos realizar a recursividade, da mesma maneira feita no \emph{cata}, usando a propria função \emph{ana} e a função de transformação. Para depois poder obter o tipo de dados pretendido, é realizada a função \emph{in}, que permite transformar a nossa soma num tipo de dados concreto.

\begin{code}
anaBlockchain f = inBlockchain.recBlockchain ( anaBlockchain f) . f 
\end{code}

A função \emph{hylo} recebe duas funções, a primeira transformando um dado tipo de dados numa soma e a segunda transforma uma \emph{BlockChain} num dado tipo de dados. Assim para poder realizar o \emph{hylo} é aplicada inicialmente uma ana dada a segunda função e posteriormente um \emph{cata} dada a primeira função. 

\begin{code}
hyloBlockchain f g = cataBlockchain f. anaBlockchain g 
\end{code}

\subsubsection{allTransactions}

De seguida é apresentada a defenição da função \emph{allTransactions}, que permite obter a \textbf{lista de Transações} de uma dada \emph{blockchain}. Para tal é aplicada a função \emph{cata} à \emph{BlockChain} sendo passada a função transformadora. Esta função é a função de transformação de uma soma, sendo do primeiro lado aplicado a projeção 2, que obtem o tuplo \emph{(Time,Transactions)} do block e após isso sendo a aplicada de novo a projeção 2 para se obter as \emph{Transactions}. Do segundo lado da soma temos de aplicar a concatenação das \emph{Transactions} de um elemento, sendo o mesmo obtido da mesma forma, com as \emph{Transcations} já obtidas.   

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Blockchain|
           \ar[d]_-{\cata{get\_transaction}}
           \ar[r]_-{|outBlockchain|}
&
    |Block + (Block >< Blockchain)|
           \ar[d]^-{|id + id >< |\cata{get\_transaction}}
\\
     |Transactions|
&
     |Block + (Block >< Transactions)|
           \ar[l]^-{|get_transaction|}
}
\end{eqnarray*}


\begin{code}
allTransactions = (cataBlockchain get_transaction)
  where get_transaction = either (p2.p2) (conc . ((p2.p2)><id))
\end{code}

\subsubsection{ledger}

Na função \emph{ledger} pretendemos obter o \textbf{Value de Cada Entity} segundo uma dada \emph{BlockChain}. Para tal é aplicada a função \emph{allTransactions}, para obter a lista de todas as \emph{Transaction} da \emph{BlockChain}. Após, seria aplicada uma \emph{cata} às \emph{Transactions}, permitindo transformar os tuplos \emph{(Entity1,(Value,Entity2))} em \emph{((Entity1,-Value),(Entity2,Value))}. Sabendo que as listas não são de um tipo concreto, é usada a função \emph{either} para identificar os dois casos. No caso de lista vazia, teremos também uma lista vazia. No outro caso teremos de transforma o nosso tuplo e concatenar o mesmo com os restantes. Para criar o nosso tuplo é aplicado um \emph{split} ao mesmo, permitindo assim criar um tuplo de tuplos. A primeira função do \emph{split} será um \textbf{produto} entre o \emph{id de Entity1} e o \emph{negate} aplicado apos a \emph{projeção 2} do tuplo presente dentro do tuplo inicial. Este \emph{negate} permite guardar a informação do \emph{Entity 1}, receptor da transação. No caso da segunda função do \emph{split} é aplicada a \emph{projeção 2} do tuplo criado apartir do \textbf{produto} de \emph{id} com \emph{swap}. Este \emph{swap} permite obter a informação de forma a ser guardada pelo \emph{ledger}.
\par
Após o primeiro \emph{cata}, é necessário criar a lista que guardaria os tuplos presentes em cada projeção dos tuplos da lista anterior. Para isto é aplicado outro \emph{cata} à lista, que permitira transformar cada elemento de maneira a que a informação \emph{(Entity,Value)} esteja presente na mesma. No caso de paragem novamente usado a lista vazia, e no outro caso como anteriormente temos de adicionar a informação de um elemento aos já presentes. Para isso é criada uma lista entre os dois elementos do tuplo sendo essa depois concatenada com a informação restante. Para poder agrupar a informação das várias \emph{Entity} é usada a função \emph{col}, permitindo agrupar os nossos tuplos como \emph{(Entity,[Value])}.
\par
Após o segundo \emph{cata} é apenas necessário adicionar a informação presente na \emph{[Values])} para obter o \emph{Ledger} pretendido. Para isso é utilizada uma \emph{cata} que transforma apenas a segunda parte do tuplo presente.

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Blockchain|
           \ar[d]_-{|ledger|}
           \ar[r]^-{|allTransactions|}
&
    |Transactions|
          \ar[r]^-{\cata{f}}
&
    |((Entity><Value)><(Entity><Value))*|
          \ar[d]^-{\cata{g}}
\\
    |Ledger|
&
    |(Entity><Value*)*|
          \ar[l]_-{\cata{h}}
&
    |(Entity><Value)*|
          \ar[l]_-{collect}
}
\end{eqnarray*}

\begin{code}
ledger = (cataList h).col.(cataList g).(cataList f).allTransactions
  where f = either nil (cons . ((split (id >< negate.p2) p2.(id >< swap))><id))
        g = either nil (conc .(conc . ((singl >< singl) )><id))
        h = either nil (cons .((id>< sum)><id))
\end{code}

\subsubsection{isValidMagicNr}

Para verificar a validade dos \emph{Magic Numbers} é necessário primeiramente obter uma lista de todos os \emph{Magic Numbers}. Para isso é aplicada uma cata à \emph{BlockChain}, que transformaria o primeiro elemento da soma num \emph{Magic Number} e no segundo adicionava a sua informação à lista já presente. Após isso, duplicavamos a lista obtida, tendo um tuplo com a mesma lista. Depois disso, aplicavamos o produto ao tuplo, tendo de um lado o tamanho da lista e o outro o tamanho da lista depois de remover os repetidos de uma lista. Apos isso, comparavamos os dois elementos do tuplo, usando a função \textbf{uncurry (==)}

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |MagicNumber* >< MagicNumber*|
           \ar[d]_-{|length >< (length.nub)|}
&
    |BlockChain|
          \ar[d]^-{|isValidMagicNr|}
          \ar[l]_-{|dup.|\cata{f}}
\\
    |Int >< Int|
          \ar[r]_-{|uncurry (==)|}
&
    |Bool|
}
\end{eqnarray*}

\begin{code}
isValidMagicNr = uncurry (==). (length>< (length.nub)) . dup . cataBlockchain f
        where f = either (singl.p1) (cons.(p1><id)) 
\end{code}


\subsection*{Problema 2}

Tal como definido anteriormente temos para o tipo de dados pedido as funções básicas que trabalham sobre o mesmo.
Estas seguem a mesma linha de pensamento, fazendo adptações à estrutura presente agora.

\subsubsection{Definições iniciais}

\begin{code}

inQTree (Left (a,(b,c))) = Cell a b c
inQTree (Right (a,(b,(c,d)))) = Block a b c d
\end{code}

\begin{code}
outQTree (Cell a b c) = i1 (a,(b,c))
outQTree (Block a b c d) = i2 (a,(b,(c,d)))
\end{code}

No caso da base deste tipo, são passadas duas funções, a função que é aplicada no tipo a da QTree e a funçao que será aplicada a cada uma das QTree presentes no block.

\begin{code}
baseQTree g h = (g >< id) -|- (h><(h >< (h >< h)))
\end{code}

\begin{code}
recQTree f = baseQTree id f
\end{code}

\begin{code}
cataQTree f = f . recQTree(cataQTree f).outQTree
\end{code}

\begin{code}
anaQTree f =  inQTree . recQTree(anaQTree f).f
\end{code}

\begin{code}
hyloQTree f g= cataQTree f . anaQTree g
\end{code}

\begin{code}
instance Functor QTree where
    fmap gen = cataQTree (inQTree. baseQTree gen id)
\end{code}

\subsubsection{rotateQTree}

O rotate pretende rodar a \emph{Qtree} existente em \textbf{90 graus}. Para isso é necessário alterar o tamanho presente nas \emph{Cell}.
Para realizar o \emph{rotate} é aplicada um \emph{cata} à \emph{Qtree}, em que a depois de aplicada uma função \emph{f} é aplicada a \emph{in} da \emph{Qtree}, para poder obter de novo a \emph{Qtree}. Esta função \emph{f} é definida como uma soma sendo que do primeiro lado seria aplicado o produto entre \emph{id} e \emph{swap}, e do segundo lado teriamos de realizar um \emph{split} para poder transformar o tuplo presente. Do primeiro lado iriamos colocar a \emph{projeção 1} após a \emph{projeção 2} após a \emph{projeção 2}. Do segundo lado teriamos de realizar um novo \emph{split}, para poder criar um tuplo neste local. Este tuplo seria criado com a \emph{projeção 1} em conjunto com um novo \emph{split}. Este seria formado pela \emph{projeção 2} após a \emph{projeção 2} após a \emph{projeção 2} e pela \emph{projeção 1} após a \emph{projeção 2}. Isto é necessário para criar o tuplo com as \emph{Qtree} presentes no \emph{Block}.


\begin{eqnarray*}
\xymatrix@@C=2cm{
    |QTree|
           \ar[d]_-{|rotaQTree|}
&
    |A + QTree ^4|
          \ar[d]^-{|id +| \cata{in.(g+h)}}
          \ar[l]^-{inQTree}
\\
    |QTree|
&
    |A + QTree ^ 4|
          \ar[l]^-{in . f}     
}
\end{eqnarray*}



\begin{code}
rotateQTree = cataQTree (inQTree.f) 
  where f = g -|- h
        g = id >< swap
        h = split (p1.p2.p2) (s1)
        s1 = split (p1) (s2)
        s2 = split (p2.p2.p2) (p1.p2)
\end{code}


\subsubsection{scaleQTree}

No caso da \emph{scale} é necessário multiplicar o tamanho dado pelo tamanho presente em cada \emph{Cell}.
Para isso é usada a função \emph{ana}. Esta permite que seja criada uma \emph{QTree} dada uma função de geração de um tipo \emph{C}, dado como input.
Esta função de geração neste caso transforma a \emph{QTree} usando a função \emph{out} e aplica-lhe uma função \emph{f}. Esta função \emph{f} é defenida pela \textbf{soma} entre uma função \emph{g} e a \emph{identidade}, visto apenas querermos alterar a informação nas \emph{Cell}. Esta função \emph{g} é definida como um \textbf{produto} entre a \emph{identidade} e um \textbf{produto} cujas funções são a multiplicação do \emph{Integer} do \emph{Cell} pelo \emph{Scale} dado.


\begin{eqnarray*}
\xymatrix@@C=2cm{
    |QTree|
           \ar[r]^-{|outQTree|}
&
    |A + QTree^4|
\\
    |QTree|
          \ar[u]^-{|scaleQTree|}
          \ar[r]_-{|f.outQTree|}
&
    |A + QTree ^ 4|
          \ar[u]_-{|id +|\ana{f.outQTree}}     
}
\end{eqnarray*}


\begin{code}

scaleQTree i = anaQTree (f . outQTree) -- Out para converter a Qtree em either para a  função ana
  where f = g -|- id
        g = id >< ((i*) >< (i*))

\end{code}


\subsubsection{invertQTree}

Na função \emph{invert} queremos apenas alterar a informação presente no tipo a da \emph{Cell}. Para tal é usado o funtor definido, sendo que este permite aplicar alteração apenas ao tipo da estrutura. A função criadora do novo pixel apenas altera o valor de cada pixel segundo a formula dada (255 - c).


\begin{eqnarray*}
\xymatrix@@C=2cm{
    |QTree|
           \ar[d]_-{|invertQTree|}
&
    |F QTree|
           \ar[l]_-{|inQTree|}
           \ar[d]^-{|F invert|}
\\
    |QTree|
          \ar[r]_-{|outQTree|}
&
    |F QTree|
}
\end{eqnarray*}


\begin{code}
invertQTree = fmap invert
  where invert (PixelRGBA8 r g b a) = PixelRGBA8 (255-r) (255-g) (255-b) (a) 
\end{code}

\subsubsection{compressQTree}

No caso da \emph{compress} é criada uma função auxiliar \emph{cataQTree'} que permite fazer a decrementação do valor passado à cata, valor esse que depende da profundidade da \emph{Qtree} e do valor passado.
A função geradora recorre à \emph{p2p} para fazer a verificação. No caso de se verificar que o nivel é \textbf{menor ou igual a 0}, mantemos a estrutura igual, no caso de ser \textbf{maior} realizamos o \emph{prune}. A função \emph{prune} permite depois criar as novas cell com a informação das anteriores. Isto é feito através de um \emph{cata}, que permite transformar a \emph{QTree} presente nesse momento num unica \emph{Cell}, no caso de este não ser já um \emph{Cell}. Na função transformadora é aplicada a \emph{uncell}, função que cria a \emph{Cell} dado um tuplo, após ser aplicada a \emph{assocl}, sendo esta aplicada após uma função \emph{f}, que realiza a transformação do \emph{Either} para um tipo pretendido. Nesta função é aplicado a \emph{identidade} do lado esquerdo e do lado direito é realizado um \emph{split}. Nesse \emph{split}, a primeira parte é criada apartir da função \emph{colorQTree} - obtendo a cor - após realizar a \emph{projeção 1}. No outro lado do tuplo seria adicionada a informação dos sizes da \emph{QTree} a ser criada.


\begin{code}
compressQTree k qt = cataQTree' f (depthQTree qt - k) qt
    where f k = p2p (id, pruneQTree) (k <= 0) . inQTree
          cataQTree' f k = (f k) . recQTree (cataQTree' f (k-1)) . outQTree
\end{code}


\begin{code}
pruneQTree = cataQTree (uncell . assocl . f)
    where f = either id (split (colorQTree.p1) (addSizes.getSizes))
          uncell = uncurry $ uncurry Cell
          addSizes ((x1,y1), (x2,y2)) = (x1+x2, y1+y2)
          getSizes = sizeQTree >< (sizeQTree.p2.p2)
          colorQTree = cataQTree $ either p1 p1
\end{code}

\subsubsection{outlineQTree}

No caso da \emph{outline}, o que pretendemos fazer é criar uma \emph{Matrix Bool}, dada uma \emph{QTree} e a função de verificação. Visto que apenas é necessário alterar a informação presente nas folhas da \emph{QTree} podemos usar a função \emph{fmap}, que permite transformar o tipo presente nas folhas, num novo tipo. Passamos assim a função \emph{f}, recebida ao \emph{fmap}. Após isso é necessário converter a \emph{QTree Bool} para \emph{Matrix Bool}, criando a \textbf{borda} nos casos necessários. Para tal é usada a função \emph{convert} que consiste num \emph{cata} que iria realizar no lado direito da \textbf{soma}, uma condição, que iria verificar se é possivel adicionar uma borda a uma dada \emph{Cell}, sabendo se esta tem mais de 3 pixeis de largura e altura (1 para cada lado da borda e o pixel do meio). Caso a condição seja verificada, é criada uma nova matrix com a informação da anterior, e no outro caso, temos a criação de uma \emph{Matrix} com a informação presente. A criação das \emph{Matrix} é feita usando as funções \emph{($<$-$>$)} e \emph{($<$\textbar$>$)} que permitem criar a parte superior e inferior de uma \emph{Matrix} e a parte esquerda e direita de uma \emph{Matrix} respetivamente.

\begin{code}
convert :: QTree Bool -> Matrix Bool
convert = cataQTree(f)
  where f = either g h 
        g (c,(i,j)) = if (c && (i >= 3) && (j >=3)) then line i j else matrix j i (const c) 
        h (a,(b,(c,d))) = ( a <|> b ) <-> (c <|> d)
        line i j = ( (matrix 1 i true) <-> ( (matrix (j-2) 1 true) <|> ( ( matrix (j-2) (i-2) false) 
                                       <|> ( matrix (j-2) 1 true) ))) 
          <-> (matrix 1 i true) 

outlineQTree f = convert .fmap f
\end{code}

\subsection*{Problema 3}

\textbf{Conversão de l k:}

\begin{eqnarray*}
\start
        |lcbr(
    l k 0 = k + 1
  )(
    l k (d + 1) = l k d + 1
  )|
%
\just\equiv{ Igualdade extensional; Cancelamento-x}
  |lcbr(
    l k . (const 0) = succ . k
  )(
    l k . succ = succ . p2 . (split (f k) (l k))
  )|
\just\equiv{Eq-+}
%
|either (l k . (const 0)) (l k . succ) = either (succ . k) (succ . p2 . (split (f k) (l k)))|
\just\equiv{ Fusão-+; in = |either (const 0) (succ)| ; Absorção-+}
%
|l k . in = (either (succ . k) (succ . p2)) . (id + (split (f k) (l k)))|
\just\equiv{ F f = (id + f)}
%
|l k . in = (either (succ . k) (succ . p2)) . F (split (f k) (l k))|
\end{eqnarray*}

\textbf{Conversão de f k:}

\begin{eqnarray*}
\start
|lcbr(
    f k 0 = 1
  )(
    f k (d + 1) = (d + k  + 1) * f k d
  )|
\just\equiv{ Igualdade extensional\{73\}; (d + k  + 1) = l k d}
        |lcbr(
    f k . (const 0) = (const 1)
  )(
    f k . succ = mul (split (f k) (l k))
  )|
\just\equiv{ Eq-+}

|either (f k . (const 0)) (f k . succ) = either (const 1) (mul (split (l k) (f k)))|

\just\equiv{ Fusão-+; in = |either (const 0) (succ)| ; Absorção-+}

|f k . in = (either (const 1) (mul)) . (id + (split (l k) (f k)))|

\just\equiv{ F f = (id + f) }

|f k . in = (either (const 1) (mul)) . F (split (l k) (f k))| $<=>$ |f k . in = (either (const 1) (mul)) . (id + (split (l k) (f k)))|
\end{eqnarray*}


\textbf{Fokkinga:}

\begin{eqnarray*}
\start

\just\equiv{Fokkinga; in = [0,succ]}
|lcbr(
  f k . in = either 1 (mul) . (id +(split (l k) (f k)))
)(
  l k . in = either succ succ . p2 . (id + (split (f k) (l k)) 
)|

\more
|split (f k) (l k) =|\cata{|split (either one mul) (either succ succ . p2)|}

\qed
\end{eqnarray*}

\textbf{Conversão g: }
\begin{eqnarray*}
\start
 |lcbr(
    g 0 = 1
  )(
    g (d + 1) = (d + 1) * g d
  )|

\just\equiv{ Igualdade extensional x 2, Def-comp}
  |lcbr(
    g . zero = one
  )(
    g . succ = mul . split s g
  )|

\just\equiv{ Eq-+}
    |either (g . zero) (g . succ) = either one (mul . split s g)|


\just\equiv{Fusão-+, Absorção-+}
|g . in = (either (const 1) (mul)) . (id + (split s g)|

\just\equiv{ F f = (id + f)}
%
|g . in = (either (const 1) (mul)) . F (split s g)| $<=>$| (either (const 1) (mul)) . (id + (split s g))|
\qed
\end{eqnarray*}


\textbf{Conversão s:}
\begin{eqnarray*}
\start
  |lcbr(
    s 0 = 1
  )(
    s (d + 1) = (s d) + 1
  )|

\just\equiv{ Igualdade extensional  x 2, Def-comp ; Cancelamento-x}
|lcbr(
  s . 0 = 1
  )(
  s . succ = succ . p2 . (split g s)
  ) 
|

\just\equiv{Eq-+}
|either (s . (const 0)) (s . succ) = either (const 1) (succ . p2 . (split g s))|

\just\equiv{Fusão-+ ; in = [0, succ] ; Absorção-+ ; F f = id+f}
|s . in = (either (1) (succ . p2)) . (id + split g s)|

\qed
\end{eqnarray*}

\textbf{Fokkinga:}

\begin{eqnarray*}
\start
\just\equiv{Fokkinga ;in = [0,succ]}
|lcbr(
  g . in = either 1 mul . (id + (split s g))
)(
  s . in = either 1 succ . (id + (split g s))
)|

|split g s = (cata(split(either 1 mul) (either 1 succ . p2)))|

\qed
\end{eqnarray*}

\textbf{Banana-split:}

\begin{eqnarray*}
\start
  |split (cataNat(split (either one mul) (either succ (succ . p2)))) (cataNat(split (either one mul) (either one (succ . p2))))|

\just\equiv{Banana-Split}

  |cataNat( (split (either one mul) (either succ (succ . p2))) >< (split (either one mul) (either one (succ . p2))) . split (F p1) (F p2))|

\just\equiv{Absorção - x}

  |cataNat(split ((split (either one mul) (either succ (succ . p2))) . (F p1)) ((split (either one mul) (either one (succ . p2))) . (F p2)))|

\just\equiv{Fusão - x}

  |cataNat(split (split ((either one mul) . (F p1)) ((either succ (succ . p2)) . (F p1))) (split ((either one mul) . (F p2)) ((either one (succ . p2)) . (F p2))))|

\just\equiv{Def F f = id + f}

  |cataNat(split (split ((either one mul) . (id + p1)) ((either succ (succ . p2)) . (id + p1))) (split ((either one mul) . (id + p2)) ((either one (succ . p2)) . (id + p2))))|

\just\equiv{Absorção-+, Nat-id}

  |cataNat(split (split (either one (mul . p1)) (either succ (succ . p2 . p1)))  (split (either one (mul . p2)) (either one ((succ .  p2 . p2)))))|

\just\equiv{Lei da Troca x 3}

  |cataNat(either (split (split one (mul . p1)) (split succ (succ . p2 . p1)))  (split (split one (mul . p2)) (split one (suc . p2 . p2))))|

\qed
\end{eqnarray*}

\textbf{Assim,} 

\begin{eqnarray*}
\start

\just\equiv{ for b i = |cata (either (const i) (b))| }

|cata (either (const base) loop) = cataNat(either (split (split one (mul . p1)) (split succ (succ . p2 . p1)))  (split (split one (mul . p2)) (split one (suc . p2 . p2))))|

\just\equiv{ Eq-+ }
    |const base = split (split one succ) (split one one)|
\more
    |loop = split (split (mul.p1) (succ.p2.p1)) (split (mul.p2) (succ.p2.p2))|

\qed
\end{eqnarray*}


\begin{code}

flatet :: ((Integer,Integer),(Integer,Integer)) -> (Integer,Integer,Integer,Integer)
flatet ((a,b),(c,d)) = (a,b,c,d) 
\end{code}

\begin{code}
unflatet :: (Integer, Integer, Integer, Integer) -> ((Integer,Integer),(Integer,Integer))
unflatet (a,b,c,d) = ((a,b),(c,d))
\end{code}

\begin{code}
base = flatet . split (f) (g)
  where f = split (one) (succ)
        g = split (one) (one)
\end{code}


\begin{code} 
loop = flatet . f .unflatet
    where f = split (g) (h)
          g = split (mul.p1) (succ.p2.p1)
          h = split (mul.p2) (succ.p2.p2)          
\end{code}

\subsection*{Problema 4}


\subsubsection{Definições iniciais}

\begin{code}

inFTree (Left b) = Unit b
inFTree (Right (a,(b,c))) = Comp a b c

outFTree (Unit b) = i1 b
outFTree (Comp a b c) = i2 (a,(b,c))  

baseFTree f g h = g -|- (f >< ( h >< h))
recFTree f = baseFTree id id f 
cataFTree f = f . recFTree ( cataFTree f). outFTree
anaFTree f = inFTree . recFTree ( anaFTree f) . f
hyloFTree f g = cataFTree f . anaFTree g

instance Bifunctor FTree where
    bimap f g = cataFTree ( inFTree . baseFTree f g id)
\end{code}

\subsubsection{generatePTree}

De maneira a gerar uma árvore de Pitágoras de uma dada ordem, recebendo a mesma como argumento é necessário aplicar a função \emph{outNat} para gerar um \emph{Either} que será o argumento de um \emph{ana} aplicado à ordem recebida. Sendo assim, a função \emph{g} devolve, também, um \emph{Either}, pois é o tipo da nossa \emph{Ftree}. Como sabemos que uma \emph{Unit} corresponde ao maior quadrado que detém lado igual a 1, o lado esquerdo da \textbf{soma} corresponde ao \emph{Float 1.0}. Ao lado direito queremos multiplicar $sqrt(2)/2$ elevado à ordem + 1 . 


\begin{eqnarray*}
\xymatrix@@C=2cm{
    |PTree|
           \ar[r]^-{|outFTree|}
&
    |B + (A >< FTree)^2|
\\
    |Int|
          \ar[u]^-{|generatePTree|}
          \ar[r]_-{|outNat|}
&
    |1+Int|
          \ar[u]_-{\cata{g}}
}
\end{eqnarray*}


\begin{code}
generatePTree =  anaFTree(g . outNat)
      where g = const (1.0) -|- (split (((sqrt(2)/2) ^) . succ) (split id id))
\end{code}


\subsubsection{drawPTree}

\begin{code}
drawPTree = undefined
\end{code}

\subsection*{Problema 5}

\subsubsection{singletonbag}

A função \emph{singleton}, dada uma cor cria um \emph{Bag} com um berlinde dessa mesma cor. Para isso, foi aplicado um \emph{split} de maneira a ser criado o tuplo \emph{(cor, número de berlindes dessa cor)}. De seguida, é aplicado o \emph{singl} a esse resultado para criar uma lista com o tuplo, após isso basta aplicar o construtor do \emph{Bag}.


\begin{eqnarray*}
\xymatrix@@C=2cm{
    |a|
          \ar[d]_-{|singletonbag|}
          \ar[r]^-{|split id 1|}
&
    |(a,1)|
           \ar[d]^-{|singl|}
\\
    |B [(a,Int)]|
&
    |[(a,Int)]|
          \ar[l]^-{|B|}
}
\end{eqnarray*}


\begin{code} 
singletonbag = B . singl . (split id (const(1)))

\end{code}

\subsubsection{muB}

Para a multiplicação de \emph{Bags} é necessário o desdobramento do tipo recebido pela \emph{muB} (\emph{Bag (Bag (Bag Marble))}) de maneira a ser obtido apenas uma lista do tipo \emph{[(Bag a, Int)]} através da aplicação da função \emph{unB} a todos os tuplos da lista. Seguidamente é, ainda, necessário uma nova aplicação da função \emph{unB} para ficar com o tipo desejado. Assim, conseguimos efetuar a multiplicação do inteiro por todos os inteiros de todos os \emph{Bags} (caso existam) através de um \emph{map}. No final, de maneira a ser devolvido novamente um \emph{Bag a}, é preciso concatenar a lista de listas devolvida pelo \emph{map} e aplicar o construtor do \emph{Bag}.

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |B [(B [(a,Int)],Int)]|
           \ar[d]_-{|muB|}
           \ar[r]_-{|fmap unB|}
&
    |B [([(a,Int)],Int)]|
           \ar[r]_-{|unB|}
&   
    |[([(a,Int)],Int)]|
            \ar[d]^-{|map f|}          
\\
    |B [(a,Int)]|
&
     |[(a,Int)]|
           \ar[l]^-{|B|}
&
|     [[(a,Int)]]|
            \ar[l]_-{|concat|}
}
\end{eqnarray*}

\begin{code}
muB = B . concat . (map (f) . unB . fmap unB)
  where f (a,b) = map (id><(*b)) a
\end{code}

\subsubsection{dist}

Como é referido no enunciado, um exemplo de uma \textbf{Distribuição} é dada por \emph{d1 = D [(’A’, 0.02),(’B’, 0.12),(’C’, 0.29),(’D’, 0.35),(’E’, 0.22)]}. Logo, a um \emph{bagOfMarbles} é aplicado uma \emph{unB} de maneira a ser retirada apenas a lista de tuplos que constitui um \emph{Bag}, de seguida efetuamos um somatório das quantidades de berlindes de cada cor e geramos um tuplo \emph{([a,Int], Total de berlindes)}. Agora, a cada elemento da lista, através de um \emph{map} é dividido o número total de berlindes pelo número de berlindes de cada cor e gerados os tuplos constituintes de uma distribuição.

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |B [(a,Int)]|
          \ar[d]_-{|dist|}
          \ar[r]^-{|unB|}
&
    |[(a,Int)]|
           \ar[d]^-{|f . split id (sum. map(snd))|}
\\
    |D [(a,Float)]|
&
    |[(a,Float)]|
          \ar[l]^-{|D|}
}
\end{eqnarray*}

\begin{code}
 
dist = D . f . split id (sum . map(snd)) . unB
  where f (a,b) = map (\ (c,d) -> (c, toFloat d / toFloat b)) a
\end{code}

\section{Como exprimir cálculos e diagramas em LaTeX/lhs2tex}
Estudar o texto fonte deste trabalho para obter o efeito:\footnote{Exemplos tirados de \cite{Ol18}.} 
\begin{eqnarray*}
\start
	|id = split f g|
%
\just\equiv{ universal property }
%
        |lcbr(
		p1 . id = f
	)(
		p2 . id = g
	)|
%
\just\equiv{ identity }
%
        |lcbr(
		p1 = f
	)(
		p2 = g
	)|
\qed
\end{eqnarray*}

Os diagramas podem ser produzidos recorrendo à \emph{package} \LaTeX\ 
\href{https://ctan.org/pkg/xymatrix}{xymatrix}, por exemplo: 
\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Nat0|
           \ar[d]_-{|cataNat g|}
&
    |1 + Nat0|
           \ar[d]^{|id + (cataNat g)|}
           \ar[l]_-{|inNat|}
\\
     |B|
&
     |1 + B|
           \ar[l]^-{|g|}
}
\end{eqnarray*}

%----------------- Fim do anexo com soluções dos alunos ------------------------%

%----------------- Índice remissivo (exige makeindex) -------------------------%

\printindex

%----------------- Outras definições auxiliares -------------------------------------------%

%if False
\begin{code}
infixr 0 .==>.
(.==>.) :: (Testable prop) => (a -> Bool) -> (a -> prop) -> a -> Property
p .==>. f = \a -> p a ==> f a

infixr 0 .<==>.
(.<==>.) :: (a -> Bool) -> (a -> Bool) -> a -> Property
p .<==>. f = \a -> (p a ==> property (f a)) .&&. (f a ==> property (p a))

infixr 4 .==.
(.==.) :: Eq b => (a -> b) -> (a -> b) -> (a -> Bool)
f .==. g = \a -> f a == g a

infixr 4 .<=.
(.<=.) :: Ord b => (a -> b) -> (a -> b) -> (a -> Bool)
f .<=. g = \a -> f a <= g a

newtype Nat = Nat {getNat :: Int}
 deriving ( Eq, Ord, Show, Enum, Read, Typeable)

instance Arbitrary Nat where
  arbitrary =
    (frequency
       [ (5, (Nat . abs) `fmap` arbitrary)
       , (1, return (Nat 0))
       ]
    ) `suchThat` ge0
    where ge0 (Nat x) = x >= 0

  shrink (Nat x) =
    [ Nat x'
    | x' <- shrink x
    , x' >= 0
    ]

newtype SmallNat = SmallNat Int
 deriving ( Eq, Ord, Show, Read,Enum,Num,Typeable)

instance Arbitrary SmallNat where
  arbitrary = liftM SmallNat (QuickCheck.choose (0,10))

  shrink (SmallNat x) =
    [ SmallNat x'
    | x' <- shrink x
    , x' >= 0, x' <= 10
    ]
    
instance Arbitrary a => Arbitrary (Matrix a) where
  arbitrary = do
    rows <- QuickCheck.choose (0,100)
    cols <- QuickCheck.choose (0,100)
    xs <- vectorOf (rows * cols) arbitrary
    return (fromList rows cols xs)
  shrink = shrinkNothing

minusNat :: Int -> Int -> Int
minusNat x = Nat.for predNat x

predNat :: Int -> Int
predNat 0 = 0
predNat n = n - 1

-- * pergunta 1

data Blockchain = Bc {bc :: Block}  |  Bcs {bcs :: (Block, Blockchain)} deriving Show
type Block = (MagicNo, (Time, Transactions))
type Transaction = (Entity, (Value, Entity))
type Transactions = [Transaction]
type Ledger = [(Entity, Value)]
type MagicNo = String
type Time = Int  -- em milisegundos
type Entity = String
type Value = Int

inBlockchain :: Either Block (Block, Blockchain) -> Blockchain
outBlockchain :: Blockchain -> Either Block (Block, Blockchain)
recBlockchain :: (c -> d) -> Either b1 (b2, c) -> Either b1 (b2, d)
cataBlockchain :: (Either Block (Block, d) -> d) -> Blockchain -> d
anaBlockchain :: (c -> Either Block (Block, c)) -> c -> Blockchain
hyloBlockchain :: (Either Block (Block, c1) -> c1) -> (c2 -> Either Block (Block, c2)) -> c2 -> c1

list2chain [] = Bc ("numeromagico1", (0, []))
list2chain [b] = Bc b
list2chain (h:t) = Bcs (h, list2chain t)

instance Arbitrary Blockchain where
  arbitrary = do
    xs <- arbitrary
    -- nao convem ter numeros repetidos
    return $ list2chain $ nubBy (\(n, _) (n', _) -> n /= n') xs
  shrink = shrinkNothing

e1 = "ent1"
e2 = "ent2"

mg1 = "b1"
mg2 = "b2"
mg3 = "b3"

tm1 = 1
tm2 = 2
tm3 = 3

t1 = (e1, (100, e2))
t2 = (e2, (50, e1))

bl1, bl2, bl3 :: Block
bl1 = (mg1, (tm1, []))
bl2 = (mg2, (tm2, [t1]))
bl3 = (mg3, (tm3, [t2]))

bs1, bs2 :: Blockchain
bs1 = Bcs (bl1, Bcs (bl2, Bc bl3))
bs2 = Bcs (bl3, Bcs (bl2, Bc bl2))
bs3 = Bc bl2
bs4 = Bcs (bl1, Bc bl3)


reverseChain :: Blockchain -> Blockchain
reverseChain = cataBlockchain (either Bc snocChain)


snocChain :: (Block, Blockchain) -> Blockchain
snocChain (b, Bc b') = Bcs (b', Bc b)
snocChain (b, Bcs (b', bs)) = Bcs (b', snocChain (b, bs))


concChain :: (Blockchain, Blockchain) -> Blockchain
concChain (b1, (Bc b)) = snocChain (b, b1)
concChain (b1, (Bcs (b, bs))) = concChain ((snocChain (b, b1)), bs)


lenChain = cataBlockchain (either (const 1) (succ . p2))

-- * pergunta 2

data QTree a = Cell a Int Int | Block (QTree a) (QTree a) (QTree a) (QTree a)
  deriving (Eq,Show)
  
inQTree :: Either (a, (Int, Int)) (QTree a, (QTree a, (QTree a, QTree a))) -> QTree a
outQTree :: QTree a -> Either (a, (Int, Int)) (QTree a, (QTree a, (QTree a, QTree a)))
baseQTree :: (a1 -> b) -> (a2 -> d1) -> Either (a1, d2) (a2, (a2, (a2, a2))) -> Either (b, d2) (d1, (d1, (d1, d1)))
recQTree :: (a -> d1) -> Either (b, d2) (a, (a, (a, a))) -> Either (b, d2) (d1, (d1, (d1, d1)))
cataQTree :: (Either (b, (Int, Int)) (d, (d, (d, d))) -> d) -> QTree b -> d
anaQTree :: (a1 -> Either (a2, (Int, Int)) (a1, (a1, (a1, a1)))) -> a1 -> QTree a2
hyloQTree :: (Either (b, (Int, Int)) (c, (c, (c, c))) -> c) -> (a -> Either (b, (Int, Int)) (a, (a, (a, a)))) -> a -> c

instance (Eq a,Arbitrary a) => Arbitrary (QTree a) where
  arbitrary = do
    rows <- QuickCheck.choose (1,100)
    cols <- QuickCheck.choose (1,100)
    xs <- vectorOf (rows * cols) arbitrary
    return ((bm2qt . fromList rows cols) xs)
  shrink = shrinkNothing

rotateMatrix :: Matrix a -> Matrix a
rotateMatrix m = matrix (ncols m) (nrows m) rot
    where
    rot (j,i) = unsafeGet (nrows m - i + 1) j m

rotatebm :: Eq a => Matrix a -> Matrix a
rotatebm = qt2bm . rotateQTree . bm2qt

rotateBMP :: FilePath -> FilePath -> IO ()
rotateBMP from to = withBMP from to rotatebm

instance Arbitrary PixelRGBA8 where
    arbitrary = do
        r <- px
        g <- px
        b <- px
        a <- px
        return (PixelRGBA8 r g b a)
      where px = QuickCheck.choose (0,255)
    shrink = shrinkNothing

sizeMatrix :: Matrix a -> (Int,Int)
sizeMatrix = ncols `split` nrows
    
sizeQTree :: QTree a -> (Int,Int)
sizeQTree = cataQTree (either snd g)
    where
    g (a,(b,(c,d))) = (fst a + fst b,snd a + snd c)

shapeQTree :: QTree a -> QTree ()
shapeQTree = fmap (!)

scalebm :: Eq a => Int -> Matrix a -> Matrix a
scalebm s = qt2bm . scaleQTree s . bm2qt

scaleBMP :: Int -> FilePath -> FilePath -> IO ()
scaleBMP s from to = withBMP from to (scalebm s)

invertbm :: Matrix PixelRGBA8 -> Matrix PixelRGBA8
invertbm = qt2bm . invertQTree . bm2qt

invertBMP :: FilePath -> FilePath -> IO ()
invertBMP from to = withBMP from to invertbm

depthQTree :: QTree a -> Int
depthQTree = cataQTree (either (const 0) f)
    where f (a,(b,(c,d))) = 1 + maximum [a,b,c,d]

compressbm :: Eq a => Int -> Matrix a -> Matrix a
compressbm n = qt2bm . compressQTree n . bm2qt

compressBMP :: Int -> FilePath -> FilePath -> IO ()
compressBMP n from to = withBMP from to (compressbm n)

outlinebm :: Eq a => (a -> Bool) -> Matrix a -> Matrix Bool
outlinebm isBackground = outlineQTree isBackground . bm2qt

outlineBMP :: FilePath -> FilePath -> IO ()
outlineBMP from to = withBMP from to (fmap mono . outlinebm (==whitePx))
    where
    mono False = whitePx
    mono True = blackPx
    
addOutlineBMP :: FilePath -> FilePath -> IO ()
addOutlineBMP from to = withBMP from to joinbm
    where
    joinbm bm = elementwiseUnsafe joinpx bm (outlinebm (==whitePx) bm)
    joinpx px1 False = px1
    joinpx px1 True = blackPx

qtOut = fromLists 
    [[  True, True, True, True, True, True, True, True ]
    ,[  True,False,False, True, True, True, True, True ]
    ,[  True,False,False, True,False,False,False, True ]
    ,[  True, True, True, True,False,False, True, True ]
    ,[ False,False,False,False,False,False, True, True ]
    ,[ False,False,False,False,False,False, True, True ]
    ,[ False,False,False,False, True, True, True, True ]
    ,[ False,False,False,False, True, True, True,False ]
    ]

bm = fromLists [
    [0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0],
    [0,0,0,0,1,1,1,0],
    [0,0,0,0,1,1,0,0],
    [1,1,1,1,1,1,0,0],
    [1,1,1,1,1,1,0,0],
    [1,1,1,1,0,0,0,0],
    [1,1,1,1,0,0,0,1]]

qt = bm2qt bm

-- * pergunta 4

data FTree a b = Unit b | Comp a (FTree a b) (FTree a b) deriving (Eq,Show)
type PTree = FTree Square Square
type Square = Float

inFTree :: Either b (a, (FTree a b, FTree a b)) -> FTree a b
outFTree :: FTree a1 a2 -> Either a2 (a1, (FTree a1 a2, FTree a1 a2))
baseFTree :: (a1 -> b1) -> (a2 -> b2) -> (a3 -> d) -> Either a2 (a1, (a3, a3)) -> Either b2 (b1, (d, d))
recFTree :: (a -> d) -> Either b1 (b2, (a, a)) -> Either b1 (b2, (d, d))
cataFTree :: (Either b1 (b2, (d, d)) -> d) -> FTree b2 b1 -> d
anaFTree :: (a1 -> Either b (a2, (a1, a1))) -> a1 -> FTree a2 b
hyloFTree :: (Either b1 (b2, (c, c)) -> c) -> (a -> Either b1 (b2, (a, a))) -> a -> c

depthFTree :: FTree a b -> Int
depthFTree = cataFTree (either (const 0) g)
    where g (a,(l,r)) = max l r + 1
    
isBalancedFTree :: FTree a b -> Bool
isBalancedFTree = isJust . cataFTree (either (const (Just 0)) g)
    where
    g (a,(l,r)) = join (liftA2 equal l r)
    equal x y = if x == y then Just (x+1) else Nothing
\end{code}
%endif

%----------------- Fim do documento -------------------------------------------%

\end{document}

