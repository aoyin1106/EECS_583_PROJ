void test(int *__restrict in, int *__restrict out, int cnt)
{
    int i;
    #pragma nounroll 
    for (i = 0; i < cnt; i++)
    {
        *in = *out;
        in++;
        out++;
    }
}