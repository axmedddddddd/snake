uses GraphABC, Timers;
 
var
  i, x, y, j: integer;
  points: array of point;
  k: char;
 
procedure food;
begin
  setbrushcolor(clblack);
  SetPenWidth(5);
  circle(26 + random(354), 26 + random(214), 3);
end;
 
procedure snake(x1, y1, x2, y2, x3, y3, x4, y4: integer; c: color);
begin
  setpenwidth(5);
  points[0].X := x1; points[0].Y := y1; 
  points[1].X := x2; points[1].Y := y2;
  points[2].X := x3; points[2].Y := y3;
  points[3].X := x4; points[3].Y := y4;
  setpencolor(c);
  setbrushcolor(c);
  Polygon(points);
end;
 
procedure StepByStep;
begin
  if (X+j<30) or (X+j>360) or (Y+i<20) or (Y+i>240) then
    (i,j) := (0,0);
  
  snake(x - 10, y, x, y, x, y + 10, x - 10, y + 10, clGreen);
  X := X + j;
  Y := Y + i;
  snake(x - 10, y, x, y, x, y + 10, x - 10, y + 10, clBlack);
  Redraw;
end;
 
procedure KeyDown(key : Integer);
begin
  Window.Caption := '' + key;
  case key of
    38,87 : (i,j) := (-1, 0); // w или up
    40,83 : (i,j) := (+1, 0); // s или down
    37,65 : (i,j) := ( 0,-1); // a или left
    39,68 : (i,j) := ( 0,+1); // d или right
    32 : (i,j) := (0,0); // space = stop
  end;
end;
 
var t := New Timer(1,StepByStep);
 
begin
  SetWindowSize(410, 270);
  SetLength(points, 4);
  SetPenWidth(20);
  SetBrushColor(ClGreen);
  points[0].X := 10; points[0].Y := 10; 
  points[1].X := 400; points[1].Y := 10;
  points[2].X := 400; points[2].Y := 260;
  points[3].X := 10; points[3].Y := 260;
  Polygon(points);
  food;
  x := 110; y := 130;
  LockDrawing;
  
  t.Start;
  OnKeyDown := KeyDown;
end.
