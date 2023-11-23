import '../globals.css';

export default function GroupLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return <section className="bg-blue-300">{children}</section>;
}