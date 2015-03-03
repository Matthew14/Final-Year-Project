using System;
using NUnit.Framework;
using MoodStreamer.Shared;

namespace MoodStreamer.Tests
{
    [TestFixture]
    public class RestClientTests
    {
        private MoodRestClient _restClient;

        [SetUp]
        public void Setup()
        {
            _restClient = new MoodRestClient();
        }

        [Test]
        public void TestLoggedInMethod()
        {
            _restClient.CheckLoggedIn();
        }

    }
}

