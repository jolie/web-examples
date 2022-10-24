const path = require('path')

module.exports = {
	mode: 'production',
	entry: './js/index.js',
	output: {
		filename: 'bundle.js',
		path: path.resolve(__dirname, 'web', 'js'),
	}
}