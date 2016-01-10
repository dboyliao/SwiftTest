var oneInt = 1
var str = "a string"
var oneFloat = 1.0

colorPrint("Black", color:"black")
colorPrint("Red", color:"red")
colorPrint("Green", color:"green")
colorPrint("Yellow", color:"yellow")
colorPrint("Blue", color:"blue")
colorPrint("Magenta", color:"magenta")
colorPrint("Cyan", color:"cyan")
colorPrint("White", color:"white")

colorPrint(oneInt, color:"red")
colorPrint(str, color:"blue")
colorPrint(oneFloat, color:"green")
colorPrint(oneFloat, color:"no such color")