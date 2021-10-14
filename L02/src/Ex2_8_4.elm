module Ex2_8_4 exposing (..)

type ShapeRec =
    CircleRec { radius : Float } |
    RectangleRec { width : Float, height : Float } |
    TriangleRec { sideA : Float, sideB : Float, sideC : Float }

areaRec : ShapeRec -> Float
areaRec shape =
    let
        heron a b c =
            let
                s = (a + b + c) / 2
            in
                sqrt (s * (s - a) * (s - b) * (s - c))
    in
        case shape of
            CircleRec {radius} -> pi * radius * radius
            RectangleRec {width, height} -> width * height
            TriangleRec {sideA, sideB, sideC} -> heron sideA sideB sideC
