import { Button } from "./components/ui/button";

function App() {
  return (
    <>
      <h1 className="text-3xl font-bold underline">ELIGHT LMS FRONTEND</h1>
      <h1>API URL: {import.meta.env.VITE_API_URL}</h1>
      <Button variant="outline">Click me</Button>
    </>
  );
}

export default App;
