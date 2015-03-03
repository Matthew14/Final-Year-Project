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

        [TearDown]
        public void TearDown()
        {
            _restClient.Logout();
        }

        [Test]
        public void TestLoginWithCorrectCredentials()
        {
            _restClient.Login("matt", "mattPass");
            Assert.IsTrue(_restClient.CheckLoggedIn());
        }

        [Test]
        public void TestLoggedInMethod()
        {
            _restClient.CheckLoggedIn();
        }

    }
}

