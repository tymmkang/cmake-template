#ifndef SAMPLE_LIBRARY_TEST_CLASS_H
#define SAMPLE_LIBRARY_TEST_CLASS_H

namespace SampleLibrary
{
    class TestClass
    {
    public:

        TestClass();

        ~TestClass();

        void Print();
    };
}

__declspec(dllexport) int Add(int a, int b);

#endif
