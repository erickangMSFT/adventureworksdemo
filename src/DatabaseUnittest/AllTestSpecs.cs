using System;
using System.IO;
using System.Collections.Generic;

using SlackerRunner;
using SlackerRunner.Util;
using Xunit;

namespace DatabaseUnittest
{
  
    public class AllTestSpecs
    {
        public static string RUN_TEST_DIR = Path.GetFullPath(Path.Combine("..", "..", "..", "TestSpecs")) + "\\";
        public static string SPEC_TEST_DIR = Path.GetFullPath(Path.Combine("..", "..", "..", "TestSpecs", "spec") + "/");

        [Theory]
        [MemberData("TestFiles", typeof(SpecTestFile))]
        public void RunAll(ISpecTestFile File)
        {
            SlackerResults TestResults = new SlackerService().Run(RUN_TEST_DIR, SPEC_TEST_DIR + File.FileName);
            Assert.True(TestResults.Passed, TestResults.Message);
        }

        /// <summary>
        /// Uses the SpecTesterResolver to figure out all the test files in a directory
        /// </summary>
        public static IEnumerable<object[]> TestFiles(Type type)
        {
            // Pass either SpecTestFile to run tests in a group or IndividualTestFile to run one test file at a time 
            List<ISpecTestFile> files = SpecsTesterResolver.ProcessDirectory(SPEC_TEST_DIR, type);

            // Back to caller
            foreach (ISpecTestFile file in files)
                yield return new object[] { file };
        }
    }
}
