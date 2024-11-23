import { useState } from "react";

interface Props {
  Search: (prompt: string) => void;
}

export default function SearchBar({ Search }: Props) {
  const [prompt, setPrompt] = useState("");

  function handleChange(event: React.ChangeEvent<HTMLInputElement>) {
    setPrompt(event.target.value);
  }

  function handleSearch() {
    Search(prompt);
  }

  return (
    <div className="searchBar">
      <input
        type="search"
        value={prompt}
        placeholder="Search"
        onChange={handleChange}
        onKeyDown={(event) => {
          if (event.key === "Enter") {
            handleSearch();
          }
        }}
      />
      <button onClick={handleSearch}>Search</button>
    </div>
  );
}
