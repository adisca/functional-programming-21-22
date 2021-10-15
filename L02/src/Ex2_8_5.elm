module Ex2_8_5 exposing (..)

type alias Point = {x: Float, y: Float}
type Shape2D
    = Circle {center: Point, radius: Float}
    | Rectangle {topLeftCorner: Point, bottomRightCorner: Point}
    | Triangle {pointA: Point, pointB: Point, pointC: Point}

pointInShape : Point -> Shape2D -> Bool
pointInShape p shape =
        let
            heron a b c =
                let
                    s = (a + b + c) / 2
                in
                    sqrt (s * (s - a) * (s - b) * (s - c))

            distance : Point -> Point -> Float
            distance p1 p2 = sqrt ((p2.x - p1.x) * (p2.x - p1.x) + (p2.y - p1.y) * (p2.y - p1.y))

            aria: Point -> Point -> Point -> Float
            aria p1 p2 p3 = heron (distance p1 p2) (distance p2 p3) (distance p3 p1)
        in
            case shape of
                Circle {center, radius} ->
                    if sqrt ((p.x - center.x) * (p.x - center.x) + (p.y - center.y) * (p.y - center.y)) < radius then
                        True
                    else
                        False
                Rectangle {topLeftCorner, bottomRightCorner} ->
                    if (topLeftCorner.x < p.x) && (p.x < bottomRightCorner.x) &&
                    (bottomRightCorner.y < p.y) && (p.y < topLeftCorner.y) then
                        True
                    else
                        False
                Triangle {pointA, pointB, pointC} ->
                    if aria pointA pointB pointC == (aria p pointA pointB + aria p pointA pointC + aria p pointB pointC)
                        then True
                        else False
