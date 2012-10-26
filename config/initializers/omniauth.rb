Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'tPIksEzKDDFTWDXsA9bKcQ', 'QmQwSxnXktmBKMEU3vkM65MWLSUjoyo1PU838hlo'

  fb_scope = { scope: 'publish_stream, email' }

  if Rails.env.production?
    provider :facebook, '195117557234715', 'd67f1b1c0db695efc82e49170644054d', fb_scope
    provider :foursquare, "DNPBT0EN5PRG2O3LFSAUHJAQ1IG2IOAESDPNZXBEMYRS2SU5", "BL5TWKHFSS2RJ0HB2HJUBEV4XI2A2LU32EWL2DN2X4IWUHWP"
  else
    provider :facebook, '138995959538207', 'f063460b1a5bb715cf1164a9e00dae36', fb_scope
    provider :foursquare, "SVKIEBKABWHXK5RYHBBCRXNSOAPGETBSPWMPBDO10PIITITB", "1NX1LRM5X5UIHDBZAO0RTXOMMETVZIRYTCOJ3UK4CXXDV131"
  end
end
