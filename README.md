# TransferFunction_arduino
Implementation of a given transfer function for arduino.

![Hs](https://user-images.githubusercontent.com/27640916/204833859-46f4e921-19ae-4bd0-8ff4-7058f828d029.PNG)


```
%MATLAB Z-Transform

s=tf('s');
k = 1;
w = 4;
H = tf([k 0 0],[1 0 -w^2]);
Hz = c2d(H,0.01,'tustin');
Hz.variable = 'z^-1'
```


![Figure](https://user-images.githubusercontent.com/27640916/204835305-2777796a-fb25-4182-98bf-cb97fde89a9a.PNG)

System is unstable.
