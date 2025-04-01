#Function 1
# Returns Area of Rectangle
def rect_area(length,width):
    return length * width

#Function 2
# Returns Surface Area of Rectangular Solid
def rect_surface_area(length,width,height):
    area= rect_area(length, width)
    area2= rect_area(length,height)
    area3= rect_area(width,height)
    return 2 * (area + area2 + area3)

# Request the dimension of a solid rectangular object

length = int(input("Enter the length of the the object as a integer: "))
width = int(input("Enter the width of the the object as a integer: "))
height = int(input("Enter the height of the the object as a integer: "))

print("Length = ", length, "Width = ", width, "Height = ", height)
print("Total Surface Area = ", str(rect_surface_area(length, width, height)))
print("Area of the rectangle: " + str(rect_area(length, width)))

