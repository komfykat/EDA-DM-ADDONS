#import "../../template.typ": *
#let title = "Дополнительные задачи"
#let author = "Морфей \n Бикмухаметов Тагир \n Бакалова Екатерина \n Цинман Семён \n Темерханов Руслан"
#let course = "Дискретная математика"
#let due_time = "до конца времён"
#let group = "Группа БЭАД241, БЭАД242, БЭАД231"
#show: footer_header.with(title, "Бригада", course, due_time, group)
#show: title_page.with(title, author, course, due_time, group)
#show: template
#show link: underline

#problem(name: "У1.1")[
  Сколько раз встречается *И* в таблице истинности высказывания
  $ and.big_(1<=i<j<=1000) (not x_i or x_j) $
]

#solution[
  Большая конъюнкция будет ложной тогда и только тогда, когда $exists i < j: not x_i or x_j = 0 <=> x_i = 1 and x_j = 0$. Значит, если большая конъюнкция истинна, то $forall i < j #h(0.2cm) x_i = 0 or x_j = 1$. Это равносильно тому, что если в строке есть $1$, то после неё все $x_i$ тоже равны $1$. Если это не так, то результат дизъюнкции этой единички и нолика, стоящего после неё, будет ложной, а значит и всё высказывание тоже будет ложной. \
  Значит, все наборы $x_n$, для которых высказывание будет истинным, выглядят так: сначала идёт $n$ нулей, а потом $1000-n$ единиц, где $0<=n<=1000$. Всего таких наборов ровно $1001$.
]
#answer[
  $1001$
]
#pagebreak()
#problem(name: "У1.2")[
  $A_1, A_2, dots, A_7$ - высказывания. Является ли тавтологией дизъюнкция всех высказываний вида
  $ (A_i or A_j or A_k or A_m) -> (A_i and A_j and A_k and A_m) #h(0.5cm) 1<=i<j<k<m<=7? $
]
#solution[
  Пусть это высказывание (большая дизъюнкция) бывает ложной для какого-то набора высказываний $A_i$. Это значит, что каждое такое высказывание (импликация) является ложным, то есть
  $ forall 1<= i<j<k<m<=7 (A_i or A_j or A_k or A_m) -> (A_i and A_j and A_k and A_m) = 0 <=> cases(A_i or A_j or A_k or A_m = 1, A_i and A_j and A_k and A_m =0) $
  Заметим, что такое бывает ровно в одном случае: когда среди $A_i, A_j, A_k, A_m$ есть и $0$, и $1$ (иначе или все 0, или все 1, и тогда система неверна). \
  То есть, если перевести на человеческий язык, если среди высказываний $A_1, A_2, dots, A_7$ взять любые четыре, в них найдутся два различных высказывания. Но что же тогда получается? Это означает, что среди $A_i$ не больше трёх $1$ и не больше трёх $0$. Тогда всего высказываний должно быть не больше $6$, а их аж семь! Ой-ой-ой! Противоречие. \
  Значит, дизъюнкция есмь тавтология.
]
#answer[
  Да.
]
#pagebreak()
#problem(name: "У1.3")[
  Пусть $A_1 supset.eq A_2 supset.eq dots supset.eq A_n supset.eq$ $-$ невозрастающая последовательность множеств, а $B_1 subset.eq B_2 subset.eq dots subset.eq B_n subset.eq dots$ $-$ неубывающая последовательность множеств. Известно, что $A_1 without B_1 = A_9 without B_9$. Докажите, что $A_2 without B_8 = A_5 without B_5$.
]
#solution[
  Заметим, что $A_9 subset.eq A_1$ и $B_1 subset.eq B_9$ из транзитивности свойства "быть подмножеством". \
  Докажем, что $A_1 = A_9$, для этого достаточно доказать, что $A_1 subset.eq A_9 <=> (x in A_1 => x in A_9)$. Рассмотрим два случая:
  == Случай 1.1. 
  $ cases(x in A_1, x in B_1) => x in.not A_1 without B_1 => x in.not A_9 without B_9 <=> cases(x in.not A_9, x in A_9 and x in B_9, delim: "[")  $
  Т.к. $A_9 subset.eq A_1$, то если $x in.not A_9$, то $x in.not A_1$. Значит, первое высказывание совокупности не может быть верным. Тогда верно второе, то есть $(x in A_1 and x in B_1) => (x in A_9 and x in B_9)$.
  == Случай 1.2.
  $ cases(x in A_1, x in.not B_1) <=> x in A_1 without B_1 <=> x in A_9 without B_9 <=> cases(x in A_9, x in.not B_9) $
  Таким образом, $forall x$ если $x in A_1$, то $x in A_9$. Значит, $A_1 subset.eq A_9$. Так как $A_9 subset.eq A_1$, то $A_1 = A_9$. Доказано. \
  Так как $A_1 supset.eq A_2 supset.eq dots supset.eq A_9$, а $A_1 = A_9$, то $A_1 = A_2 = dots = A_9 eq.colon A$ (надеюсь, это достаточно очевидно). \

  Докажем от противного, что $forall 2 <= i <= 9 #h(0.2cm) A sect (B_i without B_1) = diameter$ от противного. \
  Пусть $exists x in B_i: x in A and x in (B_i without B_1) <=> x in A and x in B_i and x in.not B_1 => x in A and x in B_9 and x in.not B_1 "(т.к." B_i subset.eq B_9")"$. \
  Посмотрим на равенство $A without B_1 = A without B_9$. Ясно, что $x in "LHS"$, но $x in.not "RHS"$. Значит, это неравенство не может быть верным! Противоречие. \
  Тогда $forall 2 <= i <= 9 #h(0.2cm) A sect (B_i without B_1) = diameter$. Значит, $A without B_1 = A without B_2 = dots = A without B_9$. В частности, $A without B_8 = A_2 without B_8 = A_5 without B_5 = A without B_5$.\
  _Q.E.D._
]
#pagebreak()

#problem(name: "У1.4")[
  *а)* Докажите, что если какое-то равенство, содержащее переменные для множеств и операции $union, sect, without$ неверно, то можно найти контрпример к нему, в котором каждое множество или пусто, или состоит из одного элемента. \
  *б)* Допустим, что у нас есть неверное равенство, содержащее переменные для множеств и операции $union, sect, without$, и по нему построена соответствующая формула, содержащая $and, or, not, equiv$. Как, опираясь на контрпример для множеств из пункта а), показать, что такая формула не является тавтологией?
]
#solution[
  *а)* Пусть в левой части содержатся множества $A_1, A_2, dots$, а в правой части множества $B_1, B_2, dots$ (некоторые из них могут совпадать). \
  Раз в нашем равенстве $"LHS" != "RHS"$, то $exists A_1, A_2, dots$ и $B_1, B_2, dots$ такие, что $"LHS"(A_1, A_2, dots) != "RHS"(B_1, B_2, dots) <=> exists x: (x in "LHS" and x in.not "RHS") or (x in.not "LHS" and x in "RHS")$. Пусть, не умаляя общности, $x in "LHS" and x in.not "RHS"$. Рассмотрим следующие множества:
  $ A'_1 = A_1 sect {x}, A'_2 = A_2 sect{x}, dots $
  $ B'_1 = B_1 sect {x}, B'_2 = B_2 sect{x}, dots $
  Ясно, что $x in "LHS"(A'_1, A'_2, dots) and x in.not "RHS"(B'_1, B'_2, dots)$. Действительно, факт принадлежности $x$ к левой или правой части не зависит от того, содержатся ли при этом в множествах $A_i$ и $B_i$ другие элементы. При этом множества $A'_1, A'_2, dots$ и $B'_1, B'_2, dots$ пусты или содержат только элемент $x$. Значит, эти наборы множеств являются контрпримером. \
  _Q.E.D._ \
  _P.S. запись $A_1, A_2, dots$ предполагает, что число множеств в любой из частей равенства может быть бесконечным_
]
#solution(no_header: true)[
  *б)* Введём обозначения:
  $ a_1 colon.eq x in A_1, a_2 colon.eq in A_2, dots $
  $ b_1 colon.eq x in B_1, b_2 colon.eq in B_2, dots $
  Именно на них строится логическая формула для нашего равенства. Воспользуемся контрпримером для пункта а) и рассмотрим следующие наборы высказываний: \
  Если $A'_i = diameter$, то $a_i colon.eq 0$. Иначе $a_i colon.eq 1$. \
  Если $B'_i = diameter$, то $b_i colon.eq 0$. Иначе $b_i colon.eq 1$. \
  Ясно, что для таких наборов высказываний $a_1, a_2, dots$ и $b_1, b_2 dots$ формула не будет истинной (иначе $x$, рассмотренный в пункте а), не существовал бы), а значит, не будет тавтологией.
]
#answer[
  Как? Вот так! (см. выше)
]
#pagebreak()
#problem(name: "У2.1")[
В классе $33$ ученика. $28$ из них знают, что такое простое число, $22$ знают, что такое факториал, и $17$ знают, что такое полином. Докажите, что в классе найдётся ученик, который знает все три этих понятия.
]
#solution()[ \
Пусть $U - $ множество всех детей, $A -$ множество детей, знающих, что такое простое число, $B -$ множество детей, знающих, что такое факториал, $C -$ множество детей, знающих, что такое полином. \ 
Предположим, что нет ученика, что знает все три понятия, т.е. что $A sect B sect C = diameter$. \
*1.* Так как $33 >= abs(A union B) = abs(A) + abs(B) - abs(A sect B) = 28 + 22 - abs(A sect B)$, то $abs(A sect B) >= 50 - 33 = 17$. \
*2.* Раз $A sect B sect C = diameter$, то $33 >= abs((A sect B) union C) = abs(A sect B) + abs(C) >= 17 + 17 = 34 => 33 >= 34$. Противоречие. Значит, $abs(A sect B sect C) >= 1$. \
_Q.E.D._
]
#pagebreak()
#problem(name: "У2.2")[
Круг разбили на $25$ секторов, пронумерованных в произвольном порядке числами от $1$ до $25$. В одном из секторов сидит Кузнечик. Он прыгает по кругу, каждым своим прыжком перемещаясь по часовой стрелке на количество секторов, равное номеру текущего сектора. Докажите, что в некотором секторе Кузнечик не побывает никогда.
]
#solution()[
Запишем в бесконечную строку номера секторов, в которых побывает Кузнечик за счётное число прыжков. Заметим, что если в строке встречается число $25$, то, т.к. всего секторов $25$, дальше тоже будет только число $25$ (т.е. с определённого момента строка выглядит как $(dots, 25, 25, 25, 25, dots,)$). Очевидно, что тогда изначальный сектор Кузнечика не равен $25$. \
Значит, перед попаданием в сектор $25$ Кузнечик должен посетить все остальные сектора. \
Предположим, что сектор $k$ Кузнечик посетил хотя бы два раза. Ясно, что тогда фрагмент строки между двумя числами $k$ будет повторяться по циклу, и в сектор $25$ Кузнечик никогда не попадёт. \
Значит, все сектора от $1$ до $24$ Кузнечик посетил ровно $1$ раз, и только потом прыгнул в сектор $25$. Значит, всего он сделал $1 + 2 + dots + 24 = (24 dot 25) / 2 = 12 dot 25$ шагов. Но это число делится на $25$, значит, после этой цепочки прыжков он попадёт в изначальный сектор, а не в сектор $25$, и сектор $25$ он никогда не посетит. \
_Q.E.D_
]
#pagebreak()

#problem(name: "У3.1")[
Дан набор из $12$ носков: $4$ красных, $4$ жёлтых, $4$ зелёных. Сколькими способами можно разделить эти носки на $6$ пар? Носки одного цвета не отличаются. Порядок носков внутри каждой пары неважен. Порядок пар неважен.
]
#solution[
*Полный перебор!* \
Рассмотрим красные носки. Есть три случая: \
1. Нет пар КК. Тогда есть либо пары КЖ, КЖ, КЖ, КЖ (для остальных носков 1 варинат - ЗЗ, ЗЗ), либо есть пары КЖ, КЖ, КЖ, КЗ (для остальных носков 1 вариант - ЖЗ, ЗЗ), либо есть пары КЖ, КЖ, КЗ, КЗ (для остальных носков 2 варианта - ЖЗ, ЖЗ или ЖЖ, ЗЗ), либо есть пары КЖ, КЗ, КЗ, КЗ (для остальных 1 вариант - ЖЗ, ЖЖ), либо есть пары КЗ, КЗ, КЗ, КЗ (для остальных 1 вариант - ЖЖ, ЖЖ). Итого 6 вариантов. 
2. Есть ровно одна пара КК. Тогда есть либо пары КЖ, КЖ (для остальных носков 2 варианта - ЖЖ, ЗЗ, ЗЗ или ЖЗ, ЖЗ, ЗЗ), либо есть пары КЖ, КЗ (для остальных носков есть 2 варианта - ЖЖ, ЖЗ, ЗЗ или ЖЗ, ЖЗ, ЖЗ), либо есть пары КЗ, КЗ (для остальных носков 2 варианта - ЗЗ, ЖЖ, ЖЖ или ЗЖ, ЗЖ, ЖЖ). Итого 6 вариантов.
3. Есть две пары КК. Тогда либо есть пара ЖЖ (для остальных 2 варианта - ЖЖ, ЗЗ, ЗЗ или ЖЗ, ЖЗ, ЗЗ), либо есть только пары ЖЗ, ЖЗ (для остальных 1 варинат - ЗЗ). Итого 3 варианта. 
Всего вариантов $6 + 6 + 3 = 15$.
]
#answer[
$15$
]
#pagebreak()

#problem(name: "У3.2")[
Для каких множеств $A$ и $B$ выполнено $(A union B) times (C union D) = (A times C) union (B times D)$?
]
#solution[
Пусть $a colon.eq x in A$, $b colon.eq x in B$, $c colon.eq y in C$, $d colon.eq y in D$. \ 

*1.* $(x, y) in (A union B) times (C union D) <=> x in A union B and y in C union D = (a or b) and (c or d)$ \
*2.* $(x, y) in (A times C) union (B times D) <=> (x, y) in A times C or (x,y) in B times D <=> (a and c) or (b and d)$ \

Таким образом, $forall c,d #h(0.2cm) (a or b) and (c or d) equiv (a and c) or (b and d)$ $(1)$. \
Предположим, что существует такой $x in A without B$, т.е. что $a = 1, b = 0$. Подставим в $(1)$: \
$
cases((a or b) and (c or d) = (1 or 0) and (c or d) = c or d,
      (a and c) or (b and d) = (1 and c) or (0 and d) = c) => c equiv c or d
$
Но это неверно для $c = 0$ и $d = 1$. Противоречие! \
Значит, $exists.not x in A without B$. Аналогично $exists.not x in B without A$. Значит, неравенство верно только для $A = B$.
]
#answer[
$A = B$
]

#pagebreak()
#problem(name:"У3.3")[
В выпуклом многоугольнике проведены некоторые диагонали так, что никакие две из них не пересекаются (из одной вершины могут выходить несколько диагоналей). Докажите, что найдутся две не соседние вершины многоугольника, из которых не проведено ни одной диагонали.
]
#solution()[
Докажем утверждение при помощи метода математической диагонали по $n$, где $n -$ число вершин многоугольника. \ 
*База.* $n = 3$. В треугольнике диагоналей вообще нет, поэтому можно выбрать любые две вершины. \
$#h(1.2cm)n = 4$. В выпуклом четырёхугольнике может быть проведено не больше $1$ диагонали без пересечений (т.к. две его диагонали всегда пересекаются), значит, в качестве искомой пары вершин можно выбрать те, что не являются концами этой диагонали. \
*Предположение.* Пусть для любого выпуклого $k$-угольника, где $k < n$, выполняется утверждение. \
*Шаг.* Докажем, что утверждение верно для $n$-угольника. \
Если в нём не проведено ни одной диагонали, то можем взять любые две несоседние его вершины. \
Иначе рассмотрим произвольную его диагональ, назовём её _базированной_. Она делит $n$-угольник на два многоугольника, в каждом из которых вершин меньше, чем $n$. Все оставшиеся диагонали $n$-угольника проведены внутри этих многоугольников, иначе какая-то диагональ будет пересекаться с _базированной_.\
Значит, для каждого из этих многоугольников верно изначальное утверждение, то есть в каждом из них найдётся пара несоседних вершин, из которых не проведено ни одной диагонали. Эта пара не может совпадать с концами _базированной_ диагонали, так как в маленьких многоугольниках они являются соседними. \
Значит, в каждом многоугольнике существует хотя бы одна вершина, не являющаяся концом _базированной_ диагонали, из которой не проведено ни одной диагонали. Взяв в каждом из многоугольников эту вершину, получим пару несоседних вершин $n$-угольника, из которых не проведено ни одной диагонали. \
Таким образом, исходя из принципов метода математической индукции, утверждение верно. \
_Q.E.D._
]
#pagebreak()

#problem(name: "У3.4")[
На окружности отмечено $300$ точек: по $100$ точек синего, красного и зелёного цветов. Докажите, что можно провести $150$ отрезков с концами в этих точках, чтобы никакие два отрезка не пересекались (даже в концах) и концы каждого отрезка были разного цвета.
]
#solution[
Давайте запишем треугольник Паскаля как табличку:

$
mat(1, 1, 1, dots;
    1, 2, 3, dots;
    )
$

Во втором столбце все числа идут подряд (то есть 1, 2, 3, $\ldots$). Этот факт очевиден, ведь число второго столбца строки n представимо в виде суммы единички и числа в предыдущей строке того же столбца (по построению треугольника Паскаля).

В силу симметрии треугольника, аналогично происходит и для второй строки.

Теперь давайте рассмотрим какое-то число $a_{i j}, 2 < i < j$ в этом треугольнике. Так как числа в треугольнике бесконечно возрастают, то чисел таких бесконечно много. Поймем, что в силу симметрии треугольника $a_{i j} = a_{j i}$. Причем по доказанному ранее такое число также есть в первом столбце и в первой строке. То есть оно встречается хотя бы четыре раза в треугольнике Паскаля. Поскольку таких $a_{i j}$ бесконечно много, задача решена!!

]
#pagebreak()

#problem(name: "У4.1")[
Докажите, что существует биекция $f : NN -> NN$, такая, что $f(f(n))$ переводит чётные числа в нечётные, а нечётные --- в чётные.
]
#solution[
Вот так выглядит эта функция:
#image("../../Pictures/dm-addon_4_1.jpg")
]

#pagebreak()
#problem(name: "У4.2")[
  Докажите, что не существует такой функции $f: NN -> NN$, что $forall n in NN #h(0.2cm) f(f(n)) = n+1$.
]
#solution[
Пусть $f(n) = k$. Тогда 
$
f(f(n)) = n + 1 => f(n+1) = f(f(f(n))) = f(f(k)) = k + 1 = f(n) + 1 => f(n+1) = f(n) + 1
$
Возьмём $f$ от обеих частей:
$
f(f(n+1)) = n + 2 "по условию"
$
$
f(f(n)+1) = f(k + 1) = f(k) + 1 = f(f(n)) + 1 = (f(n) + 1) + 1 = f(n) + 2 
$

Тогда $forall n in NN #h(0.2cm) f(n) + 2 = n + 2 <=> f(n) = n$. Но тогда $f(f(n)) = f(n) = n != n + 1$. Противоречие.
]
#pagebreak()

#problem(name: "У4.3")[
Докажите, что количество способов представить число $n$ в виде суммы $k$ слагаемых равно количеству способов представить число $n$ в виде суммы нескольких слагаемых, наибольшее из которых равно $k$. (В обоих случаях представления, отличающиеся только порядком слагаемых, считаются одинаковыми. Во втором случае в сумме может быть несколько наибольших слагаемых. Числа $n, k$ и все слагаемые предполагаются натуральными, не равными нулю.)
]
#solution[
Представим разбиение $n$ на $k$ слагаемых в виде #text(stroke: 0.4pt + blue)[#link("https://ru.wikipedia.org/wiki/%D0%94%D0%B8%D0%B0%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B0_%D0%AE%D0%BD%D0%B3%D0%B0", "диаграммы Юнга")]. Получим диаграмму из $k$ "столбиков", суммарное число клеточек в которой равно $n$. Пусть максимальный столбик имеет высоту $m$. \ 
Теперь давайте транспонируем эту диаграмму. Получим диаграмму из $m$ столбиков, максимальный в котором равен $k$, а суммарное число клеточек равно $n$. \ 
Но ведь это и есть разбиение $n$ на слагаемые, наибольшее из которых равно $k$. Аналогично можно транспонировать все диаграммы такого рода (где наибольший столбик имеет высоту $k$), и получить разбиение на $k$ слагаемых. \
Таким образом, мы построили биекцию между двумя множествами, значит, они равны. \
_Q.E.D._
\

#text(stroke: red)[TODO: ДОБАВИТЬ КАРТИНКУ-ПРИМЕР]
]
#pagebreak()

#problem(name: "У5.1")[
Приведите пример сюръекции множества натуральных чисел на себя, для которой полный прообраз любого $1$-элементного множества бесконечен.
]
#solution[
Аналогично доказательству, что $abs(QQ) = abs(NN)$

#text(stroke: red)[TODO: ДОБАВИТЬ КАРТИНКУ И ПОЯСНЕНИЕ]
]
#pagebreak()

#problem(name: "У5.2")[
Докажите аккуратно, что подмножество конечного множества конечно. (Вам понадобится определение конечного множества и индукция.)
]
#solution[
Рассмотрим подмножества конечного множества $A$. Пусть $abs(A) = n$, то есть существует биекция $f_n: A -> [n]$. Проведём индукцию по $n$. \
*База.* $n = 0 => A = diameter$. Ясно, что любое подмножество $diameter$ --- это $diameter$, и оно является конечным. \
*Шаг.* Пусть любое подмножество любого множества $A_n$ мощности $n$ конечно. Рассмотрим множество $A_(n+1)$ мощности $n + 1$ и все его подмножества:
1. Если $exists a in A_(n+1): a in.not B$, то $B subset.eq (A_(n+1) without a)$, где $a in A_(n+1)$. \ Так как $A_(n+1) without a$ --- множество мощности $n$, тогда по предположению индукции $B$ --- конечное множество.
2. Иначе $forall a in A_(n+1) #h(0.2cm) a in B$, то $B = A$. Тогда $B$ конечно. \
_Q.E.D._
]
#pagebreak()

#problem(name: "У5.3")[
$10$ друзей послали друг другу праздничные открытки, причём каждый послал пять открыток разным друзьям. Докажите, что какие-то двое послали открытки друг другу.
]
#solution[
Представим условие задачи в виде ориентированного графа на $10$ вершинах, где каждую вершину обозначает друга, а стрелки --- факт, что друг $i$ послал другу $j$ открытку. Тогда из каждой вершины исходит $5$ стрелочек, а всего стрелочек $50$. \
Предположим, что нету двух вершин, которые соединены двумя стрелочками. Тогда в каждую вершину приходит не больше четырёх стрелочек. Действительно, если есть вершина $n$, в которую приходит хотя бы пять стрелочек, то ${"множество вершин, в которые исходят стрелочки из " $n$}$ и ${"множество вершин, из которых исходят стрелочки из " $n$}$ должны пересекаться (т.к. иначе число элементов в их объединении не меньше $5 + 5 = 10$, но всего остальных друзей $9 < 10$). \
Значит, в каждую вершину приходит не больше $4$ стрелок. Тогда всего их не больше $4 dot 10 = 40 < 50$. Значит, есть вершина, в которую приходит хотя бы пять стрелочек, и тогда найдётся пара друзей, отправивших открытки друг другу. \
_Q.E.D._ 
]
#pagebreak()

#problem(name: "У5.4")[
Каждое из множеств $A_1, A_2, dots, A_100$ содержит ровно $11$ элементов. В объединении
$
A_1 union A_2 union dots union A_100
$
ровно 13 элементов. Докажите, что среди множеств есть одинаковые, то есть $exists i != j: A_i = A_j$.
]
#solution[
Очевидно, что $forall i #h(0.2cm) A_i subset.eq (A_1 union A_2 union dots union A_100)$. Значит, всего вариантов для таких различных множеств $A_i$ ровно $C_13^11 = C_13^2 = (13 dot 12)/4 = 13 dot 6 = 78 < 100 =>$ найдутся два одинаковых множества. \
_Q.E.D._
]
#pagebreak()

#problem(name: "У5.5")[
Найдите количество неубывающих инъективных функций из $[8]$ в $[11]$. \
_Функция $f$ называется неубывающей, если $x <= y => f(x) <= f(y)$_
]
#solution[
Проведём биекцию между такими функциями и строками из шаров и перегородок: \
Расставим в ряд $11$ шаров и пронумеруем их от $0$ до $10$. Это --- значения нашей функции. \
Теперь справа от каких-то восьми шаров поставим $8$ перегородок и пронумеруем их слева направо от $0$ до $8$. Это --- аргументы нашей функции. \
Теперь, если $i$-ая перегородка стоит справа от шара с номером $j$, то скажем, что $f(i) = j$. Эта функция, очевидно, не убывает. \
Раз $f$ инъективна, то никакие две перегородки не могут стоять справа от одного и того же шара. Значит, всего таких функций $C_11^8 = C_11^3 = display((11 dot 10 dot 9)/6) = 11 dot 15 = 165$.
]
#answer[
$165$
]
#pagebreak()

#problem(name: "У6.1")[
Найдите количество нулей, на которое оканчивается число $11^100 - 1$. Найдите последнюю ненулевую цифру этого числа.
]
#solution[
Представим $11$ как $10 + 1$ (insane). Тогда исходное выражение равно 
$
11^100 - 1 = (10 + 1)^100 - 1 = 10 ^100 + binom(100, 1) 10^99 + binom(100, 2) 10^98 + dots + binom(100, 96) 10^4 + binom(100, 97) 10^3 + binom(100, 98) 10^2 + \ + binom(100, 99) 10 + 1 - 1 = 10 ^100 + binom(100, 1) 10^99 + binom(100, 2) 10^98 + dots + binom(100, 96) 10^4 + binom(100, 97) 10^3 + binom(100, 98) 10^2 + binom(100, 99) 10
$
Все числа, начиная с $10^100$ и заканчивая $display(binom(100, 96) 10^4)$ делятся на $10^4$. Посчитаем сумму оставшихся слагаемых:
$
binom(100, 97) 10^3 + binom(100, 98) 10^2 + binom(100, 99) 10 = (100 dot 99 dot 98)/(3 dot 2 dot 1) dot 1000 + (100 dot 99)/(2 dot 1) dot 100 + 100 dot 10 = 162196000 
$
Видим, что это число делится на $10^3$, но не делится на $10^4$. Значит, исходное число тоже делится на $10^3$, но не на $10^4$. \
Причём остаток этого числа при делении на $10^4$ равен $162196000 % (10^4) = 6$, это и есть последняя ненулевая цифра.
]
#answer[
$3, 6$
]
#pagebreak()

#problem(name: "У6.2")[
Дайте комбинаторное доказательство равенства
$
(C_n^0)^2 + (C_n^1)^2 + dots + (C_n^n)^2 = C_(2n)^n
$
]
#solution[
=== Lemma (Д6.4).
$
sum_(j=0)^k binom(r, j) binom(s, k - j) = binom(r + s, k)
$
Рассмотрим двоичные слова длины $r + s$, в которых ровно $k$ единиц, где числа $r$ и $s$ фиксированы. Очевидно, что их количество равно $binom(r + s, k)$. \
Теперь давайте каждое такое число разделим на два: в первом будет $r$ символов, а во втором $- s$ символов. Тогда ясно, что если в первом $j$ единиц, то во втором их ровно $k - j$. Значит, всего число способов составить первое слово равно $binom(r, j)$, а второе $ - #h(0.1cm) binom(s, k - j)$. А значит, число способов составить большое слово из двух маленьких равно их произведению, то есть $binom(r, j) dot binom(s, k - j)$. А раз $j = 0, 1, 2, dots, k$, то всего число способов составить большое слово как раз равно левой части равенства. \
Заметим, что наше отображение (деление большого слова на два маленьких) является биективным. \ 
Во-первых, оно, очевидно, тотально (любое большое слово можно разделить на два маленьких). \ 
Во-вторых, если после разделения большого слова $x_1$ и большого слова $x_2$ мы получили два одинаковых набора маленьких слов, то и большие слова тоже должны быть равны. Значит, отображение инъективно. \
В-третьих, для каждого набора двух маленьких слов существует большое слово, которое является прообразом этого набора (действительно, мы же можем просто склеить два маленьких слова и получить искомое большое). Значит, отображение сюръективно. \
Раз отображение инъективно и сюръективно, то оно биективно. Значит, искомые множества действительно равны. \
_Q.E.D._ \ \
Пусть $r = s = k = n$. Тогда 
$
binom(2n, n) = sum_(j=0)^n binom(n, j) binom(n, k -j) = sum_(j=0)^n binom(n, j)^2 = binom(n, 0)^2 + binom(n, 1)^2 + dots + binom(n, n)^2
$
_Q.E.D._ 
]
#pagebreak()

#problem(name: "У6.3")[
Дайте комбинаторное доказательство равенства 
$
C_n^0 + C_(n-1)^1 + C_(n-2)^2 + dots = F_(n+1)
$
Пользуясь этим равенством, найдите числа Фибоначчи в треугольнике Паскаля.
]
#solution[
Представим, что Марио нужно взобраться на $n$-ую ступеньку лестницы, причём он может просто шагнуть на следующую ступеньку, а может сделать шаг, пропустив одну ступеньку. Очевидно, что в таком случае число способов добраться до $n$-ой ступеньки равно $F_n$ (просто по определению чисел Фибоначчи). \
Теперь рассмотрим произвольный путь Марио на $(n+1)$-ую ступеньку. Для этого он должен был преодолеть $n$ ступенек. \
Если он $i$ раз пропускал ступеньку, то таким образом преодолел $2i$ ступенек. Значит, $2i + k = n => k = n - 2i$, где $k$ --- число обычных шагов Марио. Значит, всего он сделал $n-i$ шагов, из которых $i$ раз пропустил ступеньку. Тогда всего способов составить такой путь $C_(n-i)^i$, а общее число способов добраться таким образом до $(n+1)$-ой ступеньки равно $C_n^0 + C_(n-1)^1 + dots$, и это число равно $F_(n+1)$. \
_Q.E.D._

Запишем числа треугольника Паскаля, сделав выравнивание по левому краю: \
$1$ \
$1$ $1$ \
$1$ $2$ $1$ \
$1$ $3$ $3$ $1$\
$1$ $4$ $6$ $4$ $1$\
$dots$ \
Тогда, чтобы получить $(n+1)$-ое число Фибоначчи (для $n in NN$), нужно взять последнюю единичку из $n$-ой строки, а после идти по треугольнику "конём", делая два шага влево и один шаг вверх. Таким образом мы будем получать числа, стоящие в левой части исходного равенства, и получим искомое число Фибоначчи.
]
#pagebreak()

#problem(name:"У6.4")[
Докажите, что существует бесконечно много чисел, которые встречаются в треугольнике Паскаля хотя бы $4$ раза.
]
#solution[
Запишем треугольника Паскаля следующим образом (повернув его на $45$ градусов): \
$
mat(1, 1, 1, dots;
    1, 2, 3, dots;
    1, 3, 6, dots)
$
Во втором столбце все числа идут подряд (то есть $1, 2, 3, dots$), ведь это числа вида $C_n^1 = n$.
В силу симметрии треугольника, аналогично происходит и для второй строки. \
Теперь давайте рассмотрим какое-то число $a_(i j)$, где $2 < i < j$, в этом треугольнике. Так как числа в треугольнике бесконечно возрастают, то чисел таких бесконечно много. Поймем, что в силу симметрии треугольника $a_(i j) = a_(j i)$. Причем по доказанному ранее такое число также есть во втором столбце и во второй строке, значит, оно встречается хотя бы четыре раза. Поскольку таких $a_(i j)$ бесконечно много, то утверждение задачи верно. \
_Q.E.D._
]
#pagebreak()

#problem(name: "У7.1")[
Пусть $k <= display(n/2)$. Функция $f$ из двоичных слов длины $n$, в которых $k−1$ единица, в двоичные слова длины $n$, в которых $k$ единиц, задана правилом. В слове $x = x_1 x_2 dots x_n$ найдем такое максимальное $j$, что в префиксе слова $x$ длины $j$ единиц и нулей поровну. Если следующая после этого префикса цифра $0$, заменим её на $1$ и получим слово $f(x)$. Докажите, что эта функция тотальная и, более того, является инъекцией.
]
