function love.conf(t)
  t.window.title = "Test"
  t.window.icon = "images/sheep.png"
  t.version = "0.10.2"
  t.console = true
  t.releases = {
   title = "love2dExperiments",              -- The project title (string)
   package = nil,            -- The project command and package name (string)
   loveVersion = "0.10.2",        -- The project LÖVE version
   version = "0.0.1",            -- The project version
   author = "freestraws",             -- Your name (string)
   email = "freestraws1@gmail.com",              -- Your email (string)
   description = "experiments?",        -- The project description (string)
   homepage = nil,           -- The project homepage (string)
   identifier = nil,         -- The project Uniform Type Identifier (string)
   excludeFileList = {},     -- File patterns to exclude. (string list)
   releaseDirectory = "exportedGameVersions",   -- Where to store the project releases (string)
 }
end
