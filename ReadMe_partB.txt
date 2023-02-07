Part B

To test functions copy and paste the follwing commands line by line and paste in command window of the TEST functions then press Enter to get the output.

1. TESTConvolve : to test the convolve function

>> I = imread('lena.png');
>> K = 1/16.*[1 2 1 ; 2 4 2 ; 1 2 1];
>> TESTConvolve(I,K);

2. TESTmyReduce : to test the Reduce function

>> I = imread('lena.png');
>> TESTmyReduce(I);


3. TESTmyExpand : to test the Expand function

>> I = imread('lena.png');
>> TESTmyExpand(I);

4. GaussianPyramid : to create gaussian pyramid

>> I = imread('lena.png');
>> n = 4;
>> GaussianPyramid(I,n);

5. LaplacianPyramid : to create laplacian pyramid

>> I = imread('lena.png');
>> n = 4;
>> LaplacianPyramid(I,n);

6. Reconstruct : to reconstruct from Laplacian

>> I = imread('lena.png');
>> n = 4;
>> Reconstruct(I,n)
