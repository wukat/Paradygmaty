fajna x = ("fajna " ++ show(x) ++ " ", x + 2)

sklej (first, second) f  = (first ++ fst(f second), snd(f second))

nic arg = ("", arg)

makeMeD f arg = nic $ f arg

return arg = nic arg

(>>=) (first, second) f = sklej (first, second) f

(>>) f arg = makeMeD f arg
