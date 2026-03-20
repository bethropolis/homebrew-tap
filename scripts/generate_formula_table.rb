#!/usr/bin/env ruby
# frozen_string_literal: true

require "pathname"

root = Pathname.new(__dir__).parent
readme_path = root.join("README.md")
formula_dir = root.join("Formula")

start_marker = "<!-- FORMULA_TABLE_START -->"
end_marker = "<!-- FORMULA_TABLE_END -->"

readme = readme_path.read

unless readme.include?(start_marker) && readme.include?(end_marker)
  warn "Markers not found in README.md. Add #{start_marker} and #{end_marker}."
  exit 1
end

rows = Dir[formula_dir.join("*.rb")].sort.map do |path|
  name = File.basename(path, ".rb")
  content = File.read(path)
  desc =
    content[/^\s*desc\s+"([^"]+)"/, 1] ||
    content[/^\s*desc\s+'([^']+)'/, 1] ||
    "No description"

  [name, desc]
end

table_lines = []
table_lines << "| Formula | Description |"
table_lines << "| ------- | ----------- |"

if rows.empty?
  table_lines << "| _None_ | _No formulae available_ |"
else
  rows.each do |name, desc|
    table_lines << "| `#{name}` | #{desc} |"
  end
end

replacement = [start_marker, table_lines.join("\n"), end_marker].join("\n")

pattern = /#{Regexp.escape(start_marker)}.*?#{Regexp.escape(end_marker)}/m
updated = readme.sub(pattern, replacement)

readme_path.write(updated)
