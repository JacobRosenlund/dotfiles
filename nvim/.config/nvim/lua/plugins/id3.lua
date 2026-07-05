return{
  {
    'https://gitlab.com/itaranto/id3.nvim',
    version = '*',
    config = function() require('id3lib').setup() end,
  }
}
