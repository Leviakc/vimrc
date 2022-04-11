
"coc config
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-pairs',
  \ 'coc-prettier', 
  \ 'coc-json',
  \ ]

"Emmet
let g:user_emmet_leader_key = ','
let g:user_emmet_settings = {
\  'variables': {'lang': 'es'},
\  'html': {
\    'default_attributes': {
\      'option': {'value': v:null},
\      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
\    },
\    'snippets': {
\      '!': "<!DOCTYPE html>\n"
\              ."<html lang=\"${lang}\">\n"
\              ."<head>\n"
\              ."\t<meta charset=\"${charset}\">\n"
\              ."\t<link rel=\"icon\" href=\"data:,\"/>\n"
\              ."\t<link href=\"\" rel=\"stylesheet\" />\n"
\              ."\t<title></title>\n"
\              ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
\              ."</head>\n"
\              ."<body>\n\t${child}|\n</body>\n"
\              ."</html>",
\    },
\  },
\}


