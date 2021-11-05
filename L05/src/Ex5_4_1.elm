module Ex5_4_1 exposing (..)

type alias Point = {x: Int, y: Int, z: Int}
type alias ColoredSphere = {center: Point, color: Color, radius: Int}
type Color = Red | Green | Blue

moveUpdate : ColoredSphere -> Int -> Int -> ColoredSphere
moveUpdate model x y =
    let
        point = model.center
    in
        { model | center = { point | x = point.x + x, y = point.y + y }}
