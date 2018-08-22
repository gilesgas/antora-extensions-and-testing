module.exports = function () {
  this.includeProcessor(function () {
    this.$option('position', '>>')
    this.handles((target) => target.startsWith('partial$') && !target.startsWith('partial$/abbr'))
    this.process((doc, reader, target, attrs) => {
      const contents = ['foo']
      // const contents = require('child_process').execFileSync('cat', ['./repo/modules/ROOT/pages/_partials/page-name.adoc'], { encoding: 'utf8' })
      reader.pushInclude(contents, target, target, 1, attrs)
    })
  })
}
