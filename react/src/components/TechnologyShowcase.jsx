import React, { useState } from 'react';
import { motion } from 'framer-motion';
import './TechnologyShowcase.css';

const getAssetForTechnology = (technology) => {
    const tech = technology.toLowerCase();
    if (tech.includes('flutter')) return '/images/3d/flutter.png';
    if (tech.includes('dart')) return '/images/3d/dart.webp';
    if (tech.includes('php')) return '/images/3d/php.png';
    if (tech.includes('mysql') || tech.includes('sql')) return '/images/3d/sql.webp';
    if (tech.includes('git')) return '/images/3d/git.webp';
    if (tech.includes('figma')) return '/images/3d/figma.webp';
    if (tech.includes('firebase')) return '/images/3d/firebase.png';
    if (tech.includes('node')) return '/images/3d/node.webp';
    if (tech.includes('react')) return '/images/3d/react.png';
    if (tech.includes('cloud')) return '/images/3d/cloud.png';
    return '/images/3d/code.png';
};

const getSubtitleForTechnology = (technology) => {
    const tech = technology.toLowerCase();
    if (tech.includes('flutter')) return 'Frontend Structure';
    if (tech.includes('dart')) return 'Programming Language';
    if (tech.includes('php')) return 'Backend Language';
    if (tech.includes('mysql') || tech.includes('sql')) return 'Database';
    if (tech.includes('git')) return 'Version Control';
    if (tech.includes('figma')) return 'Design Tool';
    if (tech.includes('firebase')) return 'Backend as a Service';
    if (tech.includes('node')) return 'Backend Runtime';
    if (tech.includes('react')) return 'Frontend Library';
    if (tech.includes('html')) return 'Frontend Structure';
    if (tech.includes('css')) return 'Frontend Styling';
    if (tech.includes('javascript')) return 'Frontend Logic';
    return 'Technology';
};

const TechCard = ({ technology }) => {
    const [isHovered, setIsHovered] = useState(false);
    const asset = getAssetForTechnology(technology);
    const subtitle = getSubtitleForTechnology(technology);

    return (
        <motion.div
            className="tech-card"
            onMouseEnter={() => setIsHovered(true)}
            onMouseLeave={() => setIsHovered(false)}
            animate={{
                scale: isHovered ? 1.02 : 1.0,
                backgroundColor: isHovered ? "rgba(255, 255, 255, 0.9)" : "rgba(255, 255, 255, 1)",
                borderColor: isHovered ? "rgba(103, 58, 183, 0.3)" : "rgba(238, 238, 238, 1)"
            }}
            transition={{ duration: 0.3 }}
        >
            <div className="tech-icon-container">
                <img
                    src={asset}
                    alt={technology}
                    className="tech-icon"
                    onError={(e) => { e.target.src = '/images/3d/code.png'; }}
                />
            </div>
            <div className="tech-info">
                <h3 className="tech-name">{technology}</h3>
                <p className="tech-subtitle">{subtitle}</p>
            </div>
        </motion.div>
    );
};

const TechnologyShowcase = ({ technologies }) => {
    return (
        <div className="technology-showcase">
            <h2 className="tech-showcase-title">TECHNOLOGY SHOWCASE</h2>
            <p className="tech-showcase-desc">
                The core technologies and tools used to build this project from the ground up.
            </p>

            <div className="tech-grid">
                {technologies.map((tech, index) => (
                    <TechCard key={index} technology={tech} />
                ))}
            </div>
        </div>
    );
};

export default TechnologyShowcase;
