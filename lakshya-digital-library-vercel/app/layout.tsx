import type { Metadata } from "next";
import "./globals.css";
export const metadata: Metadata = {
 title: "Lakshya Digital Library | Focus Today, Succeed Tomorrow",
 description: "A peaceful and focused study space. Explore facilities, offers and membership at Lakshya Digital Library."
};
export default function RootLayout({children}:{children:React.ReactNode}) {
 return <html lang="en"><body>{children}</body></html>;
}