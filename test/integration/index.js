var url = 'http://localhost:8000';

module.exports = {
  before: function () {
    console.log('Running:  before');
  },
  
  after: function (browser) {
    console.log('Running:  after');
    browser.end();
  },

  'should show index page': function (browser) {
    browser
      .url(url)
      .waitForElementPresent('body', 1000)
      
      .assert.title('AngularJS Todo App')
      .saveScreenshot('./test/output/index.png');
  },
  
  'should add content': function (browser) {
    browser
      .url(url)
      .waitForElementPresent('body', 1000)
      
      .setValue('input.new-content', 'content')
      .saveScreenshot('./test/output/input_content.png')
      .click('button')
      .waitForElementPresent('tbody tr', 1000)
      
      .assert.containsText('tbody td:first-child', '1')
      .assert.containsText('tbody td:nth-child(2)', 'content')
      .saveScreenshot('./test/output/added_content.png');
  },
  
  'should remove content': function (browser) {
    browser
      .url(url)
      .waitForElementPresent('body', 1000)
      
      .setValue('input.new-content', 'content')
      .click('button')
      .waitForElementPresent('tbody tr', 1000)
      
      .click('tbody tr button')
      .saveScreenshot('./test/output/removed_content.png')
      .waitForElementNotPresent('tbody tr td', 1000);
  }
};
