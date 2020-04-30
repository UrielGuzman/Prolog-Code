pertenece:: (Integer,[Integer])->Bool
pertenece (e, []) = False
pertenece (e,x:xs)=if(e==x) then True
else pertenece(e,xs)

union:: ([Integer],[Integer]) -> [Integer]
union ([],ys) = ys
union (x:xs,ys) = if(not(pertenece(x,ys))) then [x]++union(xs,ys)
else union(xs,ys)


interseccion:: ([Integer],[Integer]) -> [Integer]
interseccion ([],ys) = []
interseccion (x:xs,ys) = if(pertenece(x,ys)) then [x]++interseccion (xs,ys)
else interseccion (xs,ys)


diferencia:: ([Integer],[Integer]) -> [Integer]
diferencia ([],ys) = []
diferencia (x:xs,ys) = if(pertenece(x,ys)) then diferencia (xs,ys)
else [x]++diferencia(xs,ys)

difs:: ([Integer],[Integer]) -> [Integer]
difs (xs,ys) = (union(diferencia (xs,ys),diferencia (ys,xs)))

reemplaza:: (Integer,Integer,[Integer]) -> [Integer]
reemplaza (y,z,[]) = []
reemplaza (y,z,x:xs) = if(z==x) then [y]++reemplaza(y,z,xs) 
else [x]++reemplaza(y,z,xs)

