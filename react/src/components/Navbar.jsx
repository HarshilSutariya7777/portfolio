import React, { useState, useEffect } from 'react';
import { Link, useLocation } from 'react-router-dom';
import { Menu, X } from 'lucide-react';
import './Navbar.css';

const Navbar = () => {
    const [isOpen, setIsOpen] = useState(false);
    const [scrolled, setScrolled] = useState(false);
    const location = useLocation();

    useEffect(() => {
        const handleScroll = () => {
            setScrolled(window.scrollY > 20);
        };

        window.addEventListener('scroll', handleScroll);
        return () => window.removeEventListener('scroll', handleScroll);
    }, []);

    useEffect(() => {
        setIsOpen(false);
    }, [location]);

    const navLinks = [
        { title: 'About Me', path: '/about' },
        { title: 'Educational Diary', path: '/education' },
        { title: 'My Projects', path: '/projects' },
        { title: 'Contact', path: '/contact' },
    ];

    return (
        <nav className={`navbar ${scrolled ? 'scrolled' : ''}`}>
            <div className="navbar-container">
                <Link to="/" className="logo">
                    <img src="/images/asv.png" alt="AS Logo" height="60" width="60" />
                </Link>

                {/* Desktop Menu */}
                <div className="desktop-menu">
                    {navLinks.map((link) => (
                        <Link key={link.path} to={link.path} className="nav-link">
                            {link.title}
                        </Link>
                    ))}
                    <a
                        href="https://drive.google.com/file/d/1HQDtkdRSWNDA-jM4rpawQQ4AAjfvnKnK/view?usp=sharing"
                        target="_blank"
                        rel="noopener noreferrer"
                        className="btn-primary"
                    >
                        Download CV
                    </a>
                </div>

                {/* Mobile Menu Button */}
                <button className="mobile-menu-btn" onClick={() => setIsOpen(!isOpen)}>
                    {isOpen ? <X size={32} /> : <Menu size={32} />}
                </button>

                {/* Mobile Drawer */}
                <div className={`mobile-drawer ${isOpen ? 'open' : ''}`}>
                    <div className="drawer-content">
                        <img src="/images/asv.png" alt="AS Logo" height="80" width="80" className="drawer-logo" />
                        <div className="drawer-links">
                            <Link to="/" className="drawer-link">Home</Link>
                            {navLinks.map((link) => (
                                <Link key={link.path} to={link.path} className="drawer-link">
                                    {link.title}
                                </Link>
                            ))}
                        </div>
                        <a
                            href="https://drive.google.com/file/d/1HQDtkdRSWNDA-jM4rpawQQ4AAjfvnKnK/view?usp=sharing"
                            target="_blank"
                            rel="noopener noreferrer"
                            className="btn-primary drawer-btn"
                        >
                            Download CV
                        </a>
                    </div>
                </div>
            </div>
        </nav>
    );
};

export default Navbar;
