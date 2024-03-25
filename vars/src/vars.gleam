import argv
import envoy
import gleam/io
import gleam/result
import vars/internal

pub fn main() {
  // Call get function with args or print usage
  case argv.load().arguments {
    ["get", name] -> get(name)
    _ -> io.println("Usage: vars get <name>")
  }
}

// Get an env variable by name
fn get(name: String) -> Nil {
  let value =
    envoy.get(name)
    |> result.unwrap("")
  io.println(internal.format_pair(name, value))
}
