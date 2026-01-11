import React, { useState } from 'react';
import { motion } from 'framer-motion';
import './DevelopmentProcess.css';

const getAssetForTechnology = (technology) => {
    const tech = technology.toLowerCase();
    if (tech.includes('flutter')) return '/images/3d/flutter.png';
    if (tech.includes('dart')) return '/images/3d/dart.webp';
    if (tech.includes('php')) return '/images/3d/php.png';
    if (tech.includes('mysql') || tech.includes('sql')) return '/images/3d/sql.webp';
    if (tech.includes('git')) return '/images/3d/git.webp';
    if (tech.includes('figma')) return '/images/3d/figma.webp';
    if (tech.includes('firebase')) return '/images/3d/firebase.webp';
    if (tech.includes('node')) return '/images/3d/node.webp';
    if (tech.includes('react')) return '/images/3d/react.png';
    if (tech.includes('cloud')) return '/images/3d/cloud.png';
    return '/images/3d/code.png';
};

const ProcessCard = ({ title, technology, subtitle }) => {
    const [isHovered, setIsHovered] = useState(false);
    const asset = getAssetForTechnology(technology);

    return (
        <motion.div
            className="process-card"
            onMouseEnter={() => setIsHovered(true)}
            onMouseLeave={() => setIsHovered(false)}
            animate={{
                scale: isHovered ? 1.02 : 1.0,
                backgroundColor: isHovered ? "rgba(255, 255, 255, 0.9)" : "rgba(255, 255, 255, 1)",
                borderColor: isHovered ? "rgba(103, 58, 183, 0.3)" : "rgba(238, 238, 238, 1)"
            }}
            transition={{ duration: 0.3 }}
        >
            <div className="process-icon-container">
                <img
                    src={asset}
                    alt={technology}
                    className="process-icon"
                    onError={(e) => { e.target.src = '/images/3d/code.png'; }}
                />
            </div>
            <div className="process-info">
                <h3 className="process-tech">{technology}</h3>
                <p className="process-subtitle">{subtitle}</p>
            </div>
        </motion.div>
    );
};

const DevelopmentProcess = ({ project }) => {
    return (
        <div className="development-process">
            <h2 className="process-title">THE DEVELOPMENT PROCESS</h2>
            <p className="process-desc">From initial design to final deployment</p>

            <div className="process-grid">
                <ProcessCard
                    title="Frontend"
                    technology={project.frontend}
                    subtitle="Frontend Structure"
                />
                <ProcessCard
                    title="Backend"
                    technology={project.backend}
                    subtitle="Backend Language"
                />
                <ProcessCard
                    title="Database"
                    technology={project.database}
                    subtitle="Database"
                />
            </div>
        </div>
    );
};

export default DevelopmentProcess;
