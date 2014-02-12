
# User.destroy_all
Category.destroy_all
AppType.destroy_all

AppType.create([
  { name: "Chrome Extension" },
  { name: "Sublime Text Package" },
  { name: "Rails Gem" },
  { name: "Photoshop Plug-in" },
  { name: "Desktop App" },
  { name: "Command Line" },
  { name: "Other" }
])

Category.create([
  { name: "Coding Workflow" },
  { name: "Clean Code" },
  { name: "Testing" },
  { name: "Debugging" },
  { name: "Workspace" },
  { name: "Productivity" },
  { name: "Mobile" },
  { name: "Design" },
  { name: "Color" },
  { name: "Typography" }
])
