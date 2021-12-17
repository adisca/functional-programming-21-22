module Ex_10_9_1 where


data Op = Add | Sub | Mul | Div
instance Show Op where
    show Add = "+"
    show Sub = "-"
    show Mul = "*"
    show Div = "/"

