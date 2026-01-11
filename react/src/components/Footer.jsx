import React from 'react';
import { Link } from 'react-router-dom';
import { Github, Linkedin, Instagram } from 'lucide-react';
import './Footer.css';

const Footer = () => {
    return (
        <footer className="footer">
            <div className="footer-content">
                <div className="footer-main">
                    {/* Left Column */}
                    <div className="footer-left">
                        <h2 className="footer-logo">AS.</h2>
                        <p className="footer-desc">
                            A passionate developer crafting beautiful<br />
                            and functional digital experiences. Let's<br />
                            build something amazing together.
                        </p>

                        <div className="footer-cta">
                            <span className="cta-label">HAVE A PROJECT IN MIND?</span>
                            <a href="mailto:anadhsuhagiya65@gmail.com" className="cta-email">
                                anadhsuhagiya65@gmail.com
                            </a>
                        </div>
                    </div>

                    {/* Right Column */}
                    <div className="footer-right">
                        <div className="footer-column">
                            <h3>NAVIGATION</h3>
                            <div className="footer-links">
                                <Link to="/about">About Me</Link>
                                <Link to="/projects">My Projects</Link>
                                <Link to="/contact">Contact</Link>
                            </div>
                        </div>

                        <div className="footer-column">
                            <h3>LOCATION</h3>
                            <div className="footer-text">
                                <p>Gujarat, India</p>
                                <p className="highlight">Remote Work Preferred</p>
                                <p>Flexible Hours</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div className="footer-divider"></div>

                <div className="footer-bottom">
                    <div className="copyright">
                        <p>© 2025 Anadh Suhagiya. All rights reserved.</p>
                        <p className="developer">Developed by Anadh Suhagiya</p>
                    </div>

                    <div className="social-links">
                        <a href="https://github.com/Anadhsuhagiya" target="_blank" rel="noopener noreferrer">
                            <Github size={18} />
                        </a>
                        <a href="https://www.linkedin.com/in/anadh-suhagiya-567361229" target="_blank" rel="noopener noreferrer">
                            <Linkedin size={18} />
                        </a>
                        <a href="https://www.instagram.com/anadh_suhagiya" target="_blank" rel="noopener noreferrer">
                            <Instagram size={18} />
                        </a>
                    </div>
                </div>
            </div>
        </footer>
    );
};

export default Footer;
