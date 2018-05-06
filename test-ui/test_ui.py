from selenium import webdriver
import unittest
import time
import pytest


@pytest.mark.uitest
class TestFormater(unittest.TestCase):
    def test_plain_lowercase(self):
        driver = webdriver.Chrome()
        driver.get("http://127.0.0.1:5000/ui")
        self.do_valid_imie(driver)
        time.sleep(10)
        driver.quit()

    def do_valid_imie(self, driver):
        verify = driver.find_element_by_id('imie')
        print(verify.text)
        self.assertEqual(verify.text, "Justyna")

    def go_google(self,driver):
        mark = driver.find_element_by_partial_link_text('imiona')
        print(mark)
        mark.click()
