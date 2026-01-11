import React from 'react';
import { motion } from 'framer-motion';
import { Mail } from 'lucide-react';
import { useNavigate } from 'react-router-dom';
import './HeroSection.css';

const HeroSection = () => {
    const navigate = useNavigate();

    const handleEmailClick = () => {
        window.location.href = 'mailto:anadhsuhagiya65@gmail.com';
    };

    return (
        <section className="hero-section">
            {/* Background Text - Desktop only */}
            <div className="bg-text-container desktop-only">
                <motion.h1
                    className="bg-text"
                    initial={{ opacity: 0, x: 50 }}
                    animate={{ opacity: 1, x: 0 }}
                    transition={{ duration: 1.2, ease: "easeOut" }}
                >
                    FLUTTER<br />DEVELOPER
                </motion.h1>
            </div>

            <div className="hero-content container">
                <div className="hero-grid">
                    {/* Left Side - Text Content */}
                    <div className="hero-text">
                        <motion.p
                            className="greeting"
                            initial={{ opacity: 0, x: -20 }}
                            animate={{ opacity: 1, x: 0 }}
                            transition={{ duration: 0.8 }}
                        >
                            Hey There,
                        </motion.p>

                        <motion.div
                            className="name-container"
                            initial={{ opacity: 0, x: -20 }}
                            animate={{ opacity: 1, x: 0 }}
                            transition={{ delay: 0.2, duration: 0.8 }}
                        >
                            <span className="im-text">I'm </span>
                            <span className="name-text">Anadh<br />Suhagiya</span>
                        </motion.div>

                        <motion.p
                            className="tagline"
                            initial={{ opacity: 0 }}
                            animate={{ opacity: 1 }}
                            transition={{ delay: 0.4, duration: 0.8 }}
                        >
                            Crafting digital experiences with<br />
                            visual excellence.
                        </motion.p>

                        <motion.div
                            className="hero-buttons"
                            initial={{ opacity: 0, y: 20 }}
                            animate={{ opacity: 1, y: 0 }}
                            transition={{ delay: 0.6, duration: 0.8 }}
                        >
                            <button
                                className="btn-primary hero-btn"
                                onClick={() => navigate('/contact')}
                            >
                                Get in Touch
                            </button>
                            <button
                                className="btn-outline hero-btn"
                                onClick={handleEmailClick}
                            >
                                <Mail size={24} />
                                <span>Email Me</span>
                            </button>
                        </motion.div>
                    </div>

                    {/* Right Side - Image */}
                    <div className="hero-image-container">
                        {/* Mobile/Tablet Background Text */}
                        <div className="bg-text-container mobile-only">
                            <motion.h1
                                className="bg-text"
                                initial={{ opacity: 0, x: 50 }}
                                animate={{ opacity: 1, x: 0 }}
                                transition={{ duration: 1.2, ease: "easeOut" }}
                            >
                                FLUTTER<br />DEVELOPER
                            </motion.h1>
                        </div>

                        <motion.div
                            className="hero-image-wrapper"
                            initial={{ opacity: 0, scale: 0.95 }}
                            animate={{ opacity: 1, scale: 1 }}
                            transition={{ duration: 1 }}
                        >
                            <img
                                src="/images/anadh.png"
                                alt="Anadh Suhagiya"
                                className="hero-image"
                                onError={(e) => {
                                    e.target.style.display = 'none';
                                    e.target.nextSibling.style.display = 'flex';
                                }}
                            />
                            <div className="hero-image-placeholder" style={{ display: 'none' }}>
                                <div className="placeholder-icon"></div>
                            </div>
                            <div className="image-gradient"></div>
                        </motion.div>
                    </div>
                </div>
            </div>
        </section>
    );
};

export default HeroSection;
