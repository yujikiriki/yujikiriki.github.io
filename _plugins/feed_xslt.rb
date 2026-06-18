Jekyll::Hooks.register :site, :post_write do |site|
  feed_path = File.join(site.dest, "feed.xml")
  next unless File.exist?(feed_path)

  content = File.read(feed_path, encoding: "utf-8")
  next if content.include?("xml-stylesheet")

  pi = %(<?xml-stylesheet href="/feed.xslt" type="text/xsl"?>\n)
  content = content.sub(
    %(<?xml version="1.0" encoding="utf-8"?>),
    %(<?xml version="1.0" encoding="utf-8"?>\n#{pi})
  )
  File.write(feed_path, content, encoding: "utf-8")
end
