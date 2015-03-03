using System;
using NUnit.Framework;
using MoodStreamer.Shared;

namespace MoodStreamer.Tests
{
    [TestFixture]
    public class RestClientTests
    {
        private LoginManager _loginManager;

        [SetUp]
        public void Setup()
        {
            _loginManager = new LoginManager();
        }

        [TearDown]
        public void TearDown()
        {
            _loginManager.Logout();
        }

        [Test]
        public void TestLoginWithIncorrectCredentials()
        {
            _loginManager.Logout();
            _loginManager.PerformLogin("fakeUsername", "fakePassword");
            Assert.IsFalse(_loginManager.LoggedIn);
        }

        [Test]
        public void TestLoginWithCorrectCredentials()
        {
            _loginManager.Logout();
            _loginManager.PerformLogin("matt", "mattPass");
            Assert.IsTrue(_loginManager.LoggedIn);
        }
    }
}

