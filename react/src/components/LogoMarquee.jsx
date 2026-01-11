import React from 'react';
import './LogoMarquee.css';

const LogoMarquee = () => {
    const logos = [
        '/images/flutter.png',
        '/images/dart.png',
        '/images/react.png',
        '/images/node.svg',
        '/images/mysql.png',
        '/images/android.png',
        '/images/Canva.png',
        '/images/Google.webp',
        '/images/notion.png',
    ];

    // Duplicate list to create infinite effect
    const displayLogos = [...logos, ...logos, ...logos, ...logos];

    return (
        <div className="logo-marquee-container">
            <div className="divider"></div>
            <div className="marquee-wrapper">
                <div className="marquee-content">
                    {displayLogos.map((logo, index) => (
                        <div key={index} className="logo-item">
                            <img src={logo} alt="Technology Logo" className="tech-logo" />
                        </div>
                    ))}
                </div>
                {/* Duplicate for seamless loop */}
                <div className="marquee-content" aria-hidden="true">
                    {displayLogos.map((logo, index) => (
                        <div key={`dup-${index}`} className="logo-item">
                            <img src={logo} alt="Technology Logo" className="tech-logo" />
                        </div>
                    ))}
                </div>
            </div>
            <div className="divider"></div>
        </div>
    );
};

export default LogoMarquee;
