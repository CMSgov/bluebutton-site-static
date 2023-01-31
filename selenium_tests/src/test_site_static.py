import os
import time
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.wait import WebDriverWait

CSS_SEL_US_BANNER_TXT = ".ds-c-usa-banner__button-text"
CMS_SITE_LOGO_TXT = "HHS-logo"
US_GOV_SITE_DESC = "Official websites use .gov"
US_GOV_SITE_SEC_DESC = "Secure .gov websites use HTTPS"
US_BANNER_MEDIA_BODY_CLASS = "ds-c-usa-banner__media-body"
CMS_BB2_FOOTER_COLS = [
    {
        "title": "Blue Button 2.0 API",
        "links": [
                    {
                        "text": "Home",
                        "link": "https://bluebutton.cms.gov/",
                        "check": True
                    },
                    {
                        "text": "Documentation",
                        "link": "https://bluebutton.cms.gov/developers/",
                        "check": True
                    },
                    {
                        "text": "Support",
                        "link": "https://bluebutton.cms.gov/support/",
                        "check": True
                    },
                    {
                        "text": "Resources",
                        "link": "https://bluebutton.cms.gov/resources/",
                        "check": True
                    },
                    {
                        "text": "API Docs",
                        "link": "https://sandbox.bluebutton.cms.gov/docs/openapi",
                        "check": False
                    },
                    {
                        "text": "Developer Sandbox",
                        "link": "https://sandbox.bluebutton.cms.gov/v1/accounts/mfa/login",
                        "check": True
                    }
                ]
    },
    {
        "title": "CMS & HHS Websites",
        "links": [
                    {
                        "text": "CMS.gov",
                        "link": "https://www.cms.gov/",
                        "check": False
                    },
                    {
                        "text": "Medicare.gov",
                        "link": "https://www.medicare.gov/",
                        "check": False
                    },
                    {
                        "text": "Medicaid.gov",
                        "link": "https://www.medicaid.gov/",
                        "check": False
                    },
                    {
                        "text": "Healthcare.gov",
                        "link": "https://www.healthcare.gov/",
                        "check": False
                    },
                    {
                        "text": "HHS.gov",
                        "link": "https://www.hhs.gov/",
                        "check": False
                    },
                    {
                        "text": "Developer.cms.gov",
                        "link": "https://developer.cms.gov/",
                        "check": False
                    }
                ]
    },
    {
        "title": "Additional resources",
        "links": [
                    {
                        "text": "CMS Design System",
                        "link": "https://design.cms.gov/",
                        "check": False
                    },
                    {
                        "text": "U.S. Web Design System",
                        "link": "https://designsystem.digital.gov/",
                        "check": False
                    },
                    {
                        "text": "Freedom of Information Act",
                        "link": "https://www.foia.gov/",
                        "check": False
                    },
                    {
                        "text": "Inspector General",
                        "link": "https://oig.hhs.gov/",
                        "check": False
                    },
                    {
                        "text": "No Fear Act",
                        "link": "https://www.cms.gov/About-CMS/Agency-Information/Aboutwebsite/NoFearAct.html",
                        "check": False
                    },
                    {
                        "text": "Plain Writing",
                        "link": "https://www.medicare.gov/about-us/plain-writing/plain-writing.html",
                        "check": False
                    },
                    {
                        "text": "USA.gov",
                        "link": "https://www.usa.gov/",
                        "check": False
                    },
                    {
                        "text": "CMS Privacy Policy",
                        "link": "https://www.cms.gov/About-CMS/Agency-Information/Aboutwebsite/Privacy-Policy.html",
                        "check": False
                    },
                    {
                        "text": "CMS/HHS Vulnerability Disclosure Policy",
                        "link": "https://www.cms.gov/vulnerability-disclosure-policy",
                        "check": False
                    },
                ]
    },
]


class TestSiteStatic():
    driver_ready = False

    def setup_method(self, method):
        if not TestSiteStatic.driver_ready:
            time.sleep(10)
            TestSiteStatic.driver_ready = True
            print("set driver_ready={}".format(TestSiteStatic.driver_ready))
        else:
            print("driver_ready={}".format(TestSiteStatic.driver_ready))

        self.home_page_url = os.environ['HOME_PAGE_URL']

        opt = webdriver.ChromeOptions()
        opt.add_argument("--disable-dev-shm-usage")
        opt.add_argument("--disable-web-security")
        opt.add_argument("--allow-running-insecure-content")
        opt.add_argument("--no-sandbox")
        opt.add_argument("--disable-setuid-sandbox")
        opt.add_argument("--disable-webgl")
        opt.add_argument("--disable-popup-blocking")
        opt.add_argument("--enable-javascript")
        opt.add_argument('--allow-insecure-localhost')
        opt.add_argument('--window-size=1920,1080')
        opt.add_argument("--whitelisted-ips=''")

        self.driver = webdriver.Remote(
            command_executor='http://chrome:4444/wd/hub', options=opt)

    def teardown_method(self, method):
        self.driver.quit()

    def _find_elem_xpath(self, xpath_expr, **kwargs):
        elems = self.driver.find_elements(By.XPATH, xpath_expr)
        assert elems is not None
        return elems

    def _find_by_classname(self, clazz):
        elems = self.driver.find_elements(By.CLASS_NAME, clazz)
        assert elems is not None
        return elems

    def _find_and_click(self, timeout_sec, by, by_expr, **kwargs):
        elem = WebDriverWait(self.driver, timeout_sec).until(
            EC.visibility_of_element_located((by, by_expr)))
        assert elem is not None
        elem.click()
        return elem

    def _find_and_return(self, timeout_sec, by, by_expr, **kwargs):
        elem = WebDriverWait(self.driver, timeout_sec).until(
            EC.visibility_of_element_located((by, by_expr)))
        assert elem is not None
        return elem

    def _load_page(self, url):
        self.driver.get(url)
        self.driver.set_window_size(1485, 810)

    def _verify_us_banner(self):
        # click banner, expand
        self._find_and_click(10, By.CSS_SELECTOR, CSS_SEL_US_BANNER_TXT)
        # check official site .gov description
        elems = self._find_by_classname(US_BANNER_MEDIA_BODY_CLASS)
        assert len(elems) == 2
        assert elems[0].is_displayed()
        # check .gov security description
        assert elems[1].is_displayed()
        # sleep 2s for eye ball
        time.sleep(2)
        # click again to hide
        self._find_and_click(10, By.CSS_SELECTOR, CSS_SEL_US_BANNER_TXT)
        assert not elems[0].is_displayed()
        assert not elems[1].is_displayed()

    def _verify_cms_footer(self):
        footer_cms_info = self._find_elem_xpath("//footer/div/div/div/div")
        footer_col_titles = self._find_elem_xpath("//footer/div/div/div/h6")
        footer_col_links = self._find_elem_xpath("//footer/div/div/div/ul")
        assert len(footer_cms_info) > 0
        assert footer_cms_info[0].text == CMS_SITE_LOGO_TXT
        # now there are 3 columns of links group (ul)
        assert len(footer_col_titles) == 3
        assert len(footer_col_links) == 3
        for idx in range(3):
            expected_obj = CMS_BB2_FOOTER_COLS[idx]
            cur_title = footer_col_titles[idx]
            assert cur_title.text == expected_obj["title"]
            actual_ul = footer_col_links[idx]
            actual_list_of_li = actual_ul.find_elements(By.TAG_NAME, "li")
            expected_list_of_li = expected_obj["links"]
            expected_num_of_links = len(expected_list_of_li)
            assert len(actual_list_of_li) == expected_num_of_links
            for idx2 in range(expected_num_of_links):
                cur_li = actual_list_of_li[idx2]
                expected_lnk = expected_list_of_li[idx2]
                cur_a_list = cur_li.find_elements(By.TAG_NAME, "a")
                # grab a tag (one and only) and check text and href
                assert len(cur_a_list) == 1
                assert expected_lnk["text"] == cur_a_list[0].text
                href_val = cur_a_list[0].get_attribute('href')
                exp_lnk = expected_lnk["link"]
                assert exp_lnk == href_val or exp_lnk == href_val + "/"

    def test_site_compliances(self):
        # load home page
        self._load_page(self.home_page_url)
        self._verify_us_banner()
        # check footer for required components
        self._verify_cms_footer()
        # now go to sub pages and check banner and footer if applicable
        for col in CMS_BB2_FOOTER_COLS:
            for lnk in col["links"]:
                self._load_page(lnk["link"])
                time.sleep(5)
                if lnk["check"]:
                    self._verify_us_banner()
                    self._verify_cms_footer()
