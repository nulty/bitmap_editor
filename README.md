## BitmapEditor

BitmapEditor is an interactive bitmap editor

#### Description

Users can create a bitmap and colour it in using the commands available.

I've played around with it a bit to try and break it. I think I've managed to keep it from crashing in most cases.
Some error messages could be more user friendly and even helpful.

In building the app, I've tried to keep the system as modular as possible. Though there are some shortcomings

#### Design
1. The hardest thing was figuring out how to test an infinite loop. I'd never attempted this before and it took me a while to understand what was required.
2. It was my desire to be able to test each class individually. I've required the classes as and when I need them
3. The whole app is namespaced withing the BitmapEditor module to avoid naming collisions in future
4. More of a reliance on exception handling than I'd planned but it makes the system far more robust though catching the wrong errors at the wrong time could causes pain down the line.
5. I've tried to make sure each class is doing only what it should be doing and know what it should know using private and public methods appropriately
6. Custom printers can be added in future.
7. Different image types could be used in future too but the program is not written to swap out a bitmap for another type of image



##### Future
 - Save to file
   - It would be nice to be able to save the bitmap to file
 - More Validations!
   - user can currently draw outside the bitmap image

   
