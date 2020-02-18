const puppeteer = require('puppeteer');

(async () => {
  const browser = await puppeteer.launch(
      {
        args: [
          '--remote-debugging-port=9222',
        ],
      },
  )
  const page = await browser.newPage()
  await page.goto('https://example.com')

  await page.screenshot({path: 'example.png'})

  await browser.close()
})()
