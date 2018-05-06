from selenium import webdriver
import unittest
import time
import pytest


@pytest.mark.uitest
class TestFormater(unittest.TestCase):
    def test_plain_lowercase(self):
        driver = webdriver.Chrome()
        driver.get("http://127.0.0.1:5000/ui")
        self.do_valid_hello(driver)
        time.sleep(10)
        driver.quit()

    def do_valid_hello(self, driver):
        welcome = driver.find_element_by_id('Welcome')
        print(welcome.text)
        self.assertEqual(welcome.text, "Welcome")
